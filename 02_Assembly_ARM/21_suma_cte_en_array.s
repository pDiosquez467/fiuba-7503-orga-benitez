	.equ SWI_Print_Int, 0x6B
	.equ SWI_Print_Str, 0x69
	.equ SWI_Exit,      0x11
	.equ Stdout,        1

	.data
	arr:
		.word 12, 3, 45, 6, -9, 11, 23
	value:
		.word 5
	arr_sum:
		.word 0, 0, 0, 0, 0, 0, 0   @ Espacio reservado para el resultado
	arr_length:
		.word 7
	eol:
		.asciz "\n"

	.text
	.global _start

	_start:
		@ --- Inicialización de Punteros y Valores ---
		ldr r0, =arr          @ r0: Puntero al vector origen
		ldr r1, =arr_sum      @ r1: Puntero al vector destino

		ldr r2, =arr_length
		ldr r2, [r2]

		ldr r3, =value
		ldr r3, [r3]

	sum_loop:
		@ Carga valor de [r0] en r4 y avanza r0 (+4)
		ldr r4, [r0], #4

		add r4, r4, r3

		@ 3. Guarda r4 en [r1] y avanza r1 (+4)
		str r4, [r1], #4

		subs r2, r2, #1
		bne sum_loop

	print_init:
		ldr r4, =arr_sum
		ldr r2, =arr_length
		ldr r2, [r2]
		ldr r0, =Stdout

	print_loop:
		ldr r1, [r4], #4      @ r1 carga el dato, r4 es el puntero que avanza
		swi SWI_Print_Int

		@ Guardar r0 y r1 temporalmente para imprimir el enter
		stmfd sp!, {r0, r1}
		ldr r1, =eol
		swi SWI_Print_Str
		ldmfd sp!, {r0, r1}

		subs r2, r2, #1
		bne print_loop

	end:
		swi SWI_Exit
		.end
