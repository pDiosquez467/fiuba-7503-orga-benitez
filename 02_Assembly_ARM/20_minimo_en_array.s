	@ constantes
	.equ SWI_Print_Int, 0x6B
	.equ SWI_Exit, 		0x11
	.equ SWI_Print_Str, 0x69
	.equ Stdout,        1

	.data
	arr:
		.word 79, 14, 46, -9, 101, 99, -1
	arr_length:
		.word 7
	eol:
		.asciz "\n"

	.text
	.global _start

	@ (r1) = min arr
	_start:
		ldr r1, =arr
		ldr r1, [r1]        @ Inicializar min con el primer elemento
		ldr r2, =arr_length
		ldr r2, [r2]        @ r2 = longitud

		ldr r0, =arr        @ r0 = puntero al array

	find_min:
		ldr r3, [r0]        @ Cargar elemento actual

		cmp r1, r3          @ Comparamos Mínimo Actual (r1) vs Nuevo Dato (r3)
		movgt r1, r3        @ Si r1 > r3, actualizamos r1 con r3

		add r0, r0, #4      @ Avanzar puntero (4 bytes)
		subs r2, r2, #1     @ Decrementar contador
		bne find_min        @ Si r2 != 0, repetir

	print_min:
		ldr r0, =Stdout
		swi SWI_Print_Int

		ldr r1, =eol
		swi SWI_Print_Str

	end:
		swi SWI_Exit
		.end
