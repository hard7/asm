.section .data
.section .text
.globl _start

# 2^4 + 3^2 + 4^2
_start:
pushl $4 # power
pushl $2 # base
call power

addl $8, %esp
pushl %eax

pushl $2
pushl $3
call power

addl $8, %esp
addl %eax, (%esp)

pushl $2
pushl $4
call power

addl $8, %esp
addl (%esp), %eax

_start_exit:
movl %eax, %ebx
movl $1,   %eax
int $0x80

# function power
# signature (long base, long power)
# returns result as %eax
# registers %ebx - base, %ecx - power
power:
push %ebp
movl %esp, %ebp

movl 8(%ebp),  %ebx  # base
movl %ebx,     %eax
movl 12(%ebp), %ecx


power_loop:
cmpl $1, %ecx
je power_exit
imull %ebx, %eax
decl %ecx
jmp power_loop

power_exit:
movl %ebp, %esp
popl %ebp
ret

