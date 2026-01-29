	@ constantes
	.equ SWI_Open_File,   0x66
	.equ SWI_Read_Int,    0x6C
	.equ SWI_Print_Int,   0x6B
	.equ SWI_Close_File,  0x68
	.equ SWI_Exit,        0x11
	.equ SWI_Print_Char,  0x00
	.equ SWI_Print_Str,   0x69
	.equ Stdout,		  1

	.data
	filename:
		.asciz "entero.txt"
	eol:
		.asciz "\n"
		.align
	InFileHandle:
		.word	0

	.text
	.global _start

	_start:
		@ abrir el archivo
		ldr r0, =filename
		mov r1, #0
		swi SWI_Open_File
		bcs InFileError		@ hay algún error?
		ldr r1, =InFileHandler
		str r0, [r1]

		bl read_int		@ carga un valor en r0
		bl factorial
		bl print_r1_int
		b exit

		@ (r1) = (r0)!
	factorial:
		stmfd sp!, {r0, lr}
		cmp r0, #1
		beq factorial1
		sub r0, r0, #1
		bl factorial
		add r0, r0, #1
		mul r1, r1, r0
		b factorial_end

	factorial1:
		mov r1, #1

	factorial_end:
		bl print_r1_int
		ldmfd sp!, {r0, pc}

	read_int:
		stmfd sp!, {lr}
		ldr r0, =InFileHandle
		ldr r0, [r0]
		swi SWI_Read_Int
		ldmfd sp!, {pc}

	print_r1_int:
		stmfd sp!, {r0, r1, lr}
		ldr r0, =Stdout
		swi SWI_Print_Int
		ldr r1, =eol
		swi SWI_Print_Str
		ldmfd sp!, {r0, r1, pc}

	InFileError:
	exit:
		swi SWI_Exit
		.end
