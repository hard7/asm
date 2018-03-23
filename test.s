.section .data
.section .text
.globl _start

.type reminder @function
remimder:


_start:
# 12 / 10 -> 2
movl $12, %eax
movl $0, %edx
movl $10, %ebx
divl $10

movl %edx, %ebx
movl $1, %eax
int $0x80

