.data
    A:  .word  1, 2, 3, 4, 5, 6, 7, 8, 9, 10
    N: .word 10
    sum: .word 0
.text

.globl main

main: 

#loads the array into $t0
    la $t0, A 
#10 being loaded into $t3
    lw $t3, N
# $t1 contains i 
    ori $t1, $zero, 0
    ori $t2, $zero, $t0

#start of the loop 
loop: 

    lw $t2, 0($t2)
    slt $t2, $t0, 0
#if the i equal to 10 Exit
    beq $t2, $t3 , exit

# i is being added by 1
    addi $t1, $t1, 1
# The two lines calculate the memory address 
    sll $t2, $t1, 2
    add $t2, $t2, $t0
    j loop

exit: 

    sw $t1, sum
    
        li $v0, 1
        move $a0, $t0
        syscall

        li $v0, 10
        syscall

