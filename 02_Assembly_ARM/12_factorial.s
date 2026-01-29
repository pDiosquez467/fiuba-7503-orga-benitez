	.equ SWI_Open_File,  0x66
	.equ SWI_Read_Int,   0x6C
	.equ SWI_Print_Int,  0x6B
	.equ SWI_Print_Str,  0x69
	.equ SWI_Close_File, 0x68
	.equ SWI_Exit,       0x11
	.equ Stdout,         1    @ Salida estándar

	.data
	filename:
		.asciz "entero.txt"
	eol:
		.asciz "\n"       @ Salto de línea para formatear la salida
		.align
	InFileHandle:
		.word 0           @ Variable en memoria para guardar el ID del archivo

	.text
	.global _start

	_start:
		ldr r0, =filename
		mov r1, #0            @ Modo 0: Lectura
		swi SWI_Open_File

		@ Si falla la apertura, el sistema enciende el flag de CARRY (C=1).
		bcs InFileError       @ Branch if Carry Set: Salta al error si falló.

		ldr r1, =InFileHandle @ Cargamos la dirección de la variable
		str r0, [r1]          @ Guardamos el valor (el handle) adentro de la variable

		bl read_int           @ Llama a subrutina. Devuelve el número en R0.
		mov r1, #1            @ R1 será nuestro acumulador del factorial

	factorial:
		cmp r0, #0
		beq factorial_end     @ Si llegamos a 0, terminamos
		mul r1, r1, r0        @ R1 = R1 * R0
		bl print_r1_int       @ Imprimimos el resultado parcial (ej: 5, 20, 60...)

		sub r0, r0, #1
		b factorial

	factorial_end:
		b exit


	@ Lee del archivo cuyo ID está guardado en la variable 'InFileHandle'
	read_int:
		stmfd sp!, {lr}       @ Guardamos dirección de retorno

		ldr r0, =InFileHandle @ Buscamos la dirección de la variable
		ldr r0, [r0]          @ Leemos el valor (el Handle) desde la memoria

		swi SWI_Read_Int      @ Leemos (resultado en R0)
		ldmfd sp!, {pc}       @ Retornamos

	print_r1_int:
		stmfd sp!, {r0, r1, lr}
		mov r0, #Stdout
		swi SWI_Print_Int

		ldr r1, =eol            @ Prepara el salto de línea
		swi SWI_Print_Str       @ Imprime el string "\n"

		ldmfd sp!, {r0, r1, pc}

	InFileError:
		@ Aquí llegamos si bcs detectó error al abrir
	exit:
		swi SWI_Exit
		.end
