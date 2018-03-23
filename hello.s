.section .data
hello:
.ascii "hello\n\0"

.section .text

# writing hello to colsole output
.globl _start

_start:
movl $4, %eax # write system call
movl $1, %ebx # descriptor, 1 - stdout
movl $hello, %ecx
movl $6, %edx # bytes count
int $0x80

pushl $42
call print_number
addl $4, %esp

movl $1, %eax
movl $0, %ebx
int $0x80

