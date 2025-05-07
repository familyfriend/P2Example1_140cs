.data
   sum .word 0
   N: .word 5
   A: .word 1,2,3,4,5

.text

.globl main

main: 

    lw $t1, sum 

# loads the array
#$t0 is the starting address of the array 
    la $t0, A
    lw $t2, N
    ori $t3, $zero, 0
    ori $t4, $zero, 1

# ($t7) and ( $t0) is safe 
    ori $t7, $t0, 0
loop:
#loading the first element to $t7
    lw $t7, 0($t0)
    add $t1, $t1, $t7

#to increase the step
    add $t3, $t3, $t4

#$t7 is the temporary value 
#sll is shift left logic 
    sll $t7, $t3, 2
    add $t7, $t7, $t0
    bne $t3, $t2, loop


#without the loop need to repeat and change the offset 
    #lw $t7, 4($T0)
    #add $t1, $t1, $t7 



#These statments 
    #lui $t0, 0x1001
    #ori $t0, $t0, 0004

# while loop     

    #Prints out the result
        li $v0, 10
        move $a0, $t0
        syscall

    #Exits out the program 
        li $v0, 10
        syscall

