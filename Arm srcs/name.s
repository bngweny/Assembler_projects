.text
.global main
main:
	push {ip,lr}
	ldr r0, =message
	bl printf

	ldr r0, =fInt
	ldr r1, =temp
	bl scanf
	
	ldr r1, =temp	
	
	ldr r0, =message2
	
	bl printf
	mov r0, #0
	b end
end:
	@bx lr
	pop {ip,pc}
.data
message: .asciz"Please enter your name\n"
message2: .asciz"Hello %s%s, how are you? \n"
fInt: .asciz"%s"
temp: .word 0

