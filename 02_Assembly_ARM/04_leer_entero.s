.equ SWI_Print_String, 0x02
.equ SWI_Print_Int,    0x6B  @ Imprime Entero Decimal (R1 = valor, R0 = fd)
.equ SWI_Read_Int,     0x6C  @ Lee Entero Decimal (Retorna valor en R0)
.equ SWI_Exit,         0x11

.data
input_message:
	.asciz "Ingresa un numero: "
output_message:
	.asciz "\nIngresaste: "

.text
.global _start

_start:
	ldr r0, =input_message
	swi SWI_Print_String

	@ --- Leer el entero ---
	swi SWI_Read_Int     @ El programa espera input. El valor leído queda en R0.

	@ R0 se va a usar ahora para imprimir el siguiente texto.
	@ Si no movemos el número a otro lado (R1), lo perdemos.
	mov r1, r0

	ldr r0, =output_message
	swi SWI_Print_String

	@ --- Imprimir el número leído ---
	@ Requisitos de SWI 0x6B:
	@ R0 = 1 = Pantalla/Stdout
	@ R1 = El número entero a imprimir

	mov r0, #1           @ Le decimos al simulador: "Imprimí en la pantalla"
	swi SWI_Print_Int

	swi SWI_Exit
	.end

