.data
    A:  .word 5, 10, 25, 35, 45
    K: .word 30
    idx: .word 0
.text

.globl main

main: 

    la $t0, A 
    lw $t3, K 
    ori $t1, $zero, 0

    ori $t2, $t0, 1

loop: 
    lw $t2, 0($t2)
    slt $t2, $t0, 0
    bne $t4, $zero, exit

    addi $t1, $t1, 1
# The two lines calculate the memory address 
    sll $t2, $t1, 2
    add $t2, $t2, $t0
    j loop

exit: 

    sw $t1, idx
    
        li $v0, 1
        move $a0, $t0
        syscall

        li $v0, 10
        syscall

