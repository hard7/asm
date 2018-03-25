
.include "linux.s"

.section .bss
.equ BUFFER_SIZE, 100
.lcomm buffer, BUFFER_SIZE

#----------------------------
.equ PATH_FIRST_BYTE, 8


#----------------------------
.globl _start

.equ ARG_COUNT, 8
.equ ARG_INPUT_FILEPATH, 12
.equ ARG_OUTPUT_FILEPATH, 16

.equ ST_SIZE, 8
.equ ST_INPUT_DESC, -4
.equ ST_OUTPUT_DESC, -8

_start:
pushl %ebp
movl %esp, %ebp

subl $ST_SIZE, %esp

# opening input file
movl $SYS_OPEN, %eax
movl ARG_INPUT_FILEPATH(%ebp), %ebx
movl $INTENTION_READ, %ecx
movl $0666, %edx
int $LINUX_SYSCALL 

call print_number

movl %eax, ST_INPUT_DESC(%ebp)
#reading to buffer
movl SYS_READ(%ebp), %eax
movl ST_INPUT_DESC(%ebp), %ebx
movl $buffer, %ecx
movl $BUFFER_SIZE, %edx
int $LINUX_SYSCALL 

pushl %eax
call print_number


#closing input file
movl $SYS_CLOSE, %eax
movl ST_INPUT_DESC(%ebp), %ebx
int $LINUX_SYSCALL
 
call exit
#-----------------------------
