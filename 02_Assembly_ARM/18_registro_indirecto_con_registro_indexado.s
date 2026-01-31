	.equ SWI_Print_Int, 0x6B
	.equ SWI_Print_Str, 0x69
	.equ SWI_Exit,      0x11
	.equ Stdout,        1

	.data
	arr:
		.word 4, 8, 12, 23
	arr_length:
		.word 4
	eol:
		.asciz "\n"

	.text
	.global _start

	_start:
		ldr r2, =arr
		ldr r3, =arr_length
		ldr r3, [r3]
		mov r4, #0				@ r4: offset

	loop:
		bl print_elem
		subs r3, r3, #1
		bne loop
		b end

	print_elem:
		stmfd sp!, {r0, r1, lr}
		ldr r0, =Stdout
		ldr r1, [r2, r4]
		add r4, r4, #4
		swi SWI_Print_Int
		ldr r1, =eol
		swi SWI_Print_Str
		ldmfd sp!, {r0, r1, pc}

	end:
		swi SWI_Exit
		.end
