	@ constantes
	.equ SWI_Print_Int, 0x6B
	.equ SWI_Print_Str, 0x69
	.equ SWI_Exit, 		0x11
	.equ Stdout, 		1

	.data
	arr:
		.word	4, 8, 12, 9
	eol:
		.asciz "\n"

	.text
	.global _start

	_start:
		@ r2: base
		@ r3: longitud arr
		@ r4: offset
		ldr r2, =arr
		mov r3, #4
		mov r4, #4

	print_loop:
		bl print_elem
		bl next
		subs r3, r3, #1
		bne	print_loop
		b	end

	print_elem:
		stmfd sp!, {r0, r1, lr}			@ Stack: r0 y r1
		ldr r0, =Stdout
		ldr r1, [r2]
		swi SWI_Print_Int
		ldr r1, =eol
		swi SWI_Print_Str
		ldmfd sp!, {r0, r1, pc}			@ Unstack: r0 y r1

	next:
		stmfd sp!, {lr}
		add r2, r2, r4
		ldmfd sp!, {pc}

	end:
		swi SWI_Exit
		.end
