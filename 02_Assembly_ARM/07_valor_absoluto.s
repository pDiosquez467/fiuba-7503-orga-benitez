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
		@ abrir archivo y cargar el manejador en r5
		ldr r0, =filename
		mov r1, #0 		  	@ abrir para lectura
		swi SWI_Open_File 	@ abrir el archivo
		@ copia el manejador de archivo de r0 a r5
		mov r5, r0

		@ leer entero y almacenarlo en r2
		@ PRECOND  - r0: manejador del archivo
		@ POSTCOND - r0: entero leído desde el archivo
		swi SWI_Read_Int
		mov r2, r0

		@ cerrar archivo
		mov r0, r5
		swi SWI_Close_File

		@ chequear si el entero leído es menor a 0
		cmp r2, #0

		@ si lo es: sobreescribir el entero con su negación aritmética
		mov r3, #0
		submi r2, r3, r2

		@ mostrar el entero
		mov r0, #1
		mov r1, r2
		swi SWI_Print_Int

		@ salir del programa
		swi SWI_Exit
		.end
