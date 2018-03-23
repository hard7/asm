
# factorial_r - recursion one
# args: long value
# return: %eax result
# vars: 
.type factorial_r @function
factorial_r:
pushl %ebp
movl  %esp, %ebp

movl 8(%ebp), %eax 
cmpl $1, %eax
je   factorial_r_exit
decl %eax

pushl %eax
call factorial_r
addl $4, %esp

imull 8(%ebp), %eax

factorial_r_exit:
movl %ebp, %esp
popl %ebp
ret

.globl _start
_start:

pushl $5
call factorial_r
addl $4, %esp

movl %eax, %ebx
movl $1, %eax
int $0x80 
