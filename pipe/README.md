# pipeline optim

# 0 build
## each time modify ncopy.ys
make drivers

## each time modify pipe-full.hcl
make psim VERSION=full

## rebulid all
make VERSION=full

# 1 elementary test
## test on a 4-element array
./psim -g sdriver.yo
./psim -t sdriver.yo

## test on a 63-element array
./psim -g ldriver.yo
./psim -t ldriver.yo

## test length
./check-len.pl < ncopy.yo

# 2 further test
## Testing your driver files on the ISA simulator
make drivers
../misc/yis sdriver.yo

## test correctness
./correctness.pl

# 3 benchmark

## test on benchmark
(cd ../y86-code; make testpsim)

## test  with extensive regression tests
(cd ../ptest; make SIM=../pipe/psim TFLAGS=-i)

## correctness
./correctness.pl -p

# 4 get score
./benchmark.pl
