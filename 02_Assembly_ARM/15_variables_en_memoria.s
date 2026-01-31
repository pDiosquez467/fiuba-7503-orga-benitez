	@ constantes
	.equ SWI_Print_Int,  0x6B
	.equ SWI_Exit,		 0x11
	.equ SWI_Print_Str,  0x69
	.equ Stdout,		 1

	.data
	entero1:
		.word 5
	entero2:
		.word 27
	eol:
		.asciz "\n"


	.text
	.global _start

	_start:
		@ imprimimos el contenido de ambas variables

		@ muestra entero1
		ldr r0, =Stdout
		ldr r1, =entero1		@ (r1) = DIR(entero1)
		ldr r1, [r1]			@ (r1) = entero1
		swi SWI_Print_Int
		bl print_eol

		@ muestra entero2
		ldr r0, =Stdout
		ldr r1, =entero2		@ (r1) = DIR(entero2)
		ldr r1, [r1]			@ (r1) = entero2
		swi SWI_Print_Int
		bl print_eol

		@ carga 47 en entero1
		ldr r0, =entero1
		mov r1, #47
		str r1, [r0]			@ almacena 47 en la memoria apuntada por r0

		@ carga 15 en entero2
		ldr r0, =entero2
		mov r1, #15
		str r1, [r0]

		@ muestra entero1
		ldr r0, =Stdout
		ldr r1, =entero1
		ldr r1, [r1]
		swi SWI_Print_Int
		bl print_eol

		@ muestra entero2
		ldr r0, =Stdout
		ldr r1, =entero2
		ldr r1, [r1]
		swi SWI_Print_Int
		bl print_eol

		swi SWI_Exit

	print_eol:
		stmfd sp!, {r0, r1, lr}
		ldr r0, =Stdout
		ldr r1, =eol
		swi SWI_Print_Str
		ldmfd sp!, {r0, r1, pc}


		.end
