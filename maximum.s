.section .data
numbers:
.long 2,41,20,5,50,47,1,14,0

.section .text

.globl _start

_start:
movl $0, %edi
movl numbers, %eax
movl %eax, %ebx

loop:
cmpl $0, %eax
je exit

incl %edi
movl numbers(,%edi,4), %eax
cmpl %eax, %ebx
jge loop

movl %eax, %ebx
jmp loop

exit:
movl $1, %eax
int $0x80


