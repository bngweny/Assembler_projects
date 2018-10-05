.global main
main:
	push {ip,lr}
	ldr r0, =message
	bl printf

	ldr r0, =fInt
	ldr r1, =temp
	bl scanf
	
	ldr r1, =temp
	ldr r1, [r1]

	mov r2, #70
	cmp r1,r2
	bgt is_greater

    not_greater:
	ldr r0, =message2
	bl printf
	b end

   is_greater:
	ldr r0, =message3
	bl printf
   end:
	pop {ip,pc}
	
.data

message: .asciz"Please enter the temperature\n"
message2: .asciz"Wear long pants. Get some exercize outside\n"
message3: .asciz"Wear shorts\n"
fInt: .asciz"%d"
temp: .word 0

