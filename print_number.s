
.section .bss
.lcomm my_buffer, 100

.section .data
next_line_symbol:
.ascii "\n"

.section .text

# .globl _start
# _start:

# pushl $12345
# call print_number
# addl $4, %esp

# movl $1, %eax
# movl $0, %ebx
# int $0x80

#----------------
.globl print_number

print_number:
pushl %ebp
movl %esp, %ebp

pushl $my_buffer
pushl 8(%ebp)
call to_acsii
addl $8, %esp

movl %eax, %edx
movl $4, %eax
movl $1, %ebx
movl $my_buffer, %ecx
int $0x80

call print_return_line

movl %ebp, %esp
popl %ebp
ret
#----------------
to_acsii:
pushl %ebp
movl %esp, %ebp
movl 8(%ebp), %eax
movl $10, %ebx

parser_loop:
movl $0, %edx
divl %ebx
pushl %edx
cmpl $0, %eax
je write_buffer
jmp parser_loop

write_buffer:
movl $0, %eax           # counter
movl 12(%ebp), %ebx     # pointer to write

write_buffer_loop:
cmpl %esp, %ebp
je exit
popl %edx
addb $48, %dl
movb %dl, (%ebx,%eax,1)
incl %eax
jmp write_buffer_loop

exit:
popl %ebp
ret
#-----------------
print_return_line:
movl $4, %eax
movl $1, %ebx
movl $next_line_symbol, %ecx
movl $1, %edx
int $0x80
ret
#-----------------


# movl $4, %eax
# movl $1, %ebx
# movl $my_buffer, %ecx
# movl $10, %edx
# int $0x80
