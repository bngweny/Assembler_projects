.global main
main:	
	ldr r0, =message
	bl printf

	ldr r0, =fInt
	ldr r1, =temp
	bl scanf
	
	ldr r1, =temp
	ldr r1, [r1]
	
	mov r0, #0
	mov r2, #1
	mov r3, #0
	b fibo

    fibo:
	cmp r1,#0
	bgt is_greater
    not_greater:
	bx lr
    is_greater:
	add r3,r0,r2
	mov r0,r2
	mov r2,r3
	add r0,r0,#-1
	bl printf
	b fibo
.data

message: .asciz"Please enter the fibonacci position\n"
message2: .asciz"%d\n"
fInt: .asciz"%d"
temp: .word 0

