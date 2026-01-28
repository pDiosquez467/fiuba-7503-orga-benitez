@ constantes
	.equ SWI_Open_File,  0x66
	.equ SWI_Read_Int,   0x6C
	.equ SWI_Print_Int,  0x6B
	.equ SWI_Close_File, 0x68
	.equ SWI_Exit,       0x11

	.data
	filename:
		.asciz "entero.txt"

	@ sección de código
	.text
	.global _start

	_start:
		ldr r0, =filename

		@ Modo 0 = LECTURA (Input).
		mov r1, #0

		swi SWI_Open_File

		@ Guardamos el "handle" (ID del archivo) en R5.
		mov r5, r0

		swi SWI_Read_Int

		cmp r0, #0
		bpl print_int

		@ RSB (Reverse Subtract) hace "Destino = Op2 - Op1".
		rsb r0, r0, #0

	print_int:
		@ Preparamos R1 con el valor a imprimir (SWI 0x6B lo busca ahí)
		mov r1, r0

		@ Seleccionamos la Salida: 1 = Stdout
		mov r0, #1

		swi SWI_Print_Int

	fin:
		@ Recuperamos el handle original desde R5 para cerrar el archivo correcto.
		mov r0, r5
		swi SWI_Close_File
		swi SWI_Exit
		.end
