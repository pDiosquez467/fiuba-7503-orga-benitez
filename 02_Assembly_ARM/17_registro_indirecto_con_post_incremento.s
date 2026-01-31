	.equ SWI_Print_Int, 0x6B
	.equ SWI_Exit,      0x11
	.equ SWI_Print_Str, 0x69
	.equ Stdout, 	    1

	.data
	arr:
		.word 4, 8, 12, 23
	eol:
		.asciz "\n"

	.text
	.global _start

	_start:
		ldr r2, =arr		@ r2: Puntero base al inicio del array
		mov r3, #4			@ r3: Contador de elementos (longitud)

	print_loop:
		bl print_elem

		@ Control del Bucle:
		@ 's' actualiza el flag Z (Zero). Si el resultado es 0, Z se enciende.
		subs r3, r3, #1

		@ Branch if Not Equal (to Zero): Si Z está apagado (r3 != 0), repetimos.
		bne print_loop

		b end

	print_elem:
		stmfd sp!, {r0, r1, lr}
		ldr r0, =Stdout
		@ Post-Incremento
		@ 1. Carga en r1 el valor apuntado por [r2].
		@ 2. Automáticamente suma #4 a r2 (avanza al siguiente entero).
		ldr r1, [r2], #4

		swi SWI_Print_Int

		ldr r1, =eol
		swi SWI_Print_Str

		ldmfd sp!, {r0, r1, pc}

	end:
		swi SWI_Exit
		.end
