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

## compile ncopy.yo file
../misc/yas ncopy.ys

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


# Score record
## loop unrolling
not unroll: 0/60
unroll 10 times: 25.5/60, 
unroll 12 times: 21.9/60
unroll 8 times: 28.2/60, 
unroll 7 times: 29.4/60, 11.27
unroll 6 times: 30.0/60, 11.25
unroll 5 times: 29.5/60, 11.27
unroll 4 times: 27.2/60, 11.37

In the end, we found 6 is optimal.

The file is in **ncopyV6.ys**

The disadvantge: use one more register to store **limit** 

## solve load use hazard
 unroll 6, score: 60/60, 9.95 (V9)
 unroll 7, score: 59.4/60, 10.03
unroll 5, score:60/60, 9.90
unroll 4, score:60/60, 9.89 (Best, V12)
unroll 3, score: 59.8. 10.01

The best file is **V12**.

## binary search tree
We first start to modify V9(unroll 6)
unroll 6, 684byte, score: 60/60, CPE 9.21(V14)

unroll 8, 1079bytes,(overflow!) score: 60/60, CPE 9,20(V15)