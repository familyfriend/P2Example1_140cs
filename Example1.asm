.data
    ival: .word 100
    jval: .word 200
    fval: .word 0
    gval: .word 10 
    hval: .word 5

.text

.globl main

main: 

# loading all the values 
    lw $t0, fval 
    lw $t1, gval 
    lw $t2, hval 
    lw $t3, ival 
    lw $t4, jval 

#creating branch for if statement 
   # beq - values in the branch is equal 
    bne $t3, $t4, false 

#the area between the (beq) and (false:) is the true statement part

    add $t0, $t1, $t2

#Once false is placed the truth statment ends and the false begin
#But needs a jump to avoid the programs to continuing from true to false

    j exit
    false: 

    #lui(load upper immedimete) loads the memory address
        lui $t5, 0xFFFF
    #applies other 16 bits to the register
        ori $t5, $t5, 0xFFFF
     #use xor to create 1's compulment 
        xor $t2, $t2, 0xFFFF
    # now we have 32 bits that are all 1'statement
    addi $t2, $t2, 1
    add $t0, $t1, $t2

    #Saving the word from the register to memory 
    sw $t0, fval

    exit: 
        sw $t0, fval
        
        li $v0, 10
        move $a0, $t0
        syscall

        li $v0, 10
        syscall

