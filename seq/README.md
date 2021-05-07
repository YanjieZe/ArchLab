# test
./ssim -t ../y86-code/asumi.yo

# debug
./ssim -g ../y86-code/asumi.yo

# iaddl
```HCL
fetch:  icode:ifun <- M1[PC]
    rA:rB <- M1[PC+1]
    valC <- M8[PC+2]
    valP <- PC+10

Decode: valB <- R[rB]

Execute: valE <- valC + valB
        Set CC

Memory: None

WriteBack: R[rB] <- valE

UpdatePC: PC <- valP
```