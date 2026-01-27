@ constantes
.equ SWI_Print_String, 0x02
.equ SWI_Exit, 0x11

.data
first_string:
	.asciz "Hola\n"
second_string:
	.asciz "Chau\n"

.text
.global _start

_start:
	ldr r3, =first_string
	
	@ --- LLAMADA A SUBRUTINA ---
	@ 'BL' (Branch with Link) hace dos cosas:
	@ 1. Guarda la dirección de la SIGUIENTE instrucción (la línea del 2do ldr) en el registro LR (R14).
	@ 2. Salta a la etiqueta 'print_r3'.
	bl	print_r3

	ldr r3, =second_string
	bl	print_r3
	
	b	fin

@ --- SUBRUTINA ---
print_r3:
	@ stmfd = Store Multiple Full Descending (Push)
	@ sp!   = Actualiza el puntero de pila (lo mueve hacia abajo en memoria)
	@ {r0}  = Guardamos R0 porque lo vamos a usar acá adentro.
	@ {lr}  = Guardamos la dirección de retorno que nos dio el 'BL'.
	stmfd sp!, {r0,lr}
	mov r0, r3              @ Copiamos el argumento R3 a R0 para el SWI
	swi SWI_Print_String

	@ ldmfd = Load Multiple Full Descending (Pop)
	@ {r0}  = Recuperamos el valor original de R0 (lo dejamos como lo encontramos).
	@ {pc}  = Sacamos el valor que era LR de la pila, pero lo metemos directamente
	@         en el PC (Program Counter). Al escribir en el PC, el procesador salta
	@         automáticamente a esa dirección. Es el "return".
	ldmfd sp!, {r0,pc}

fin:
	swi SWI_Exit
	.end
