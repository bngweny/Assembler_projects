.data

.balign 4
prompt: .asciz "\nEnter Number 1\n"

.balign 4
number_format: .asciz "%d"

.balign 4
number_response: .int 0

.align 4
my_array: .word 82, 70, 93, 77, 91, 30, 42, 6, 92, 64

.align 4
integer_printf: .asciz "%d "

.align 4
newline_printf: .asciz "\n"

.text

fill_array:
	push {r4, r5, r6, lr}
	mov r4, r0
	mov r5, r1
	mov r6, #0
	
	
	.add_nums:
		ldr r0, =prompt
		bl printf
		
		ldr r0, =number_format
		ldr r1, =number_response
		bl scanf
	
		ldr r1, =number_response
		ldr r1, [r1]
		

print_array:
	push {r4, r5, r6, lr} @keep them in stack
	mov r4, r0	@address of array
	mov r5, r1	@num items
	mov r6, #0	@current item
	b .Lprint_array_check_loop @condition check
	
	.Lprint_array_loop:
		ldr r0, =integer_printf
		ldr r1, [r4, +r6, LSL #2] @r1=*(r4 +r6 *4)or <<2
		bl printf
		
		add r6, r6, #1
		
	.Lprint_array_check_loop:
		cmp r6, r5
		bne .Lprint_array_loop
		
	ldr r0, =newline_printf
	bl printf
	
	pop {r4, r5, r6, lr}
	bx lr
	
.global main
main:
	push {r4, lr}
	ldr r0, =my_array
	mov r1, #10
	
	bl print_array
	
	mov r0, #0
	pop {r4, lr}
	bx lr	
	