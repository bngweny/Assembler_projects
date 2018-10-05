.global main
main:
	@push {ip,lr}
	mov r3, #1
	mov r2, #0
	
loop:
	cmp r3, #5
	beq end
	
	ldr r0, =message
	bl printf

	ldr r0, =fInt
	ldr r1, =message
	bl scanf

	ldr r0, =message2
	ldr r4, [r0]
	
	add r3,r3,#1
	cmp r4,r2
	bgt is_greater
	b loop
is_greater:
	mov r2,r4
	b loop

end:
	@ldr r0, =message2
	@bl printf
	@pop {ip,pc}
	bx lr


message: .asciz"Please enter the next number\n"
message2: .asciz"%d\n"
fInt: .asciz"%d"
temp: .int
