.equ LINUX_SYSCALL, 0x80
.equ SYS_EXIT, 1
.equ SYS_READ, 3
.equ SYS_WRITE, 4
.equ SYS_OPEN, 5  # 5, filename address, intension(0: read, 03101 - write), rights 0666
.equ SYS_CLOSE, 6

.equ INTENTION_READ, 0

.globl exit

exit:
movl $1, %eax
movl $0, %ebx
int $LINUX_SYSCALL
