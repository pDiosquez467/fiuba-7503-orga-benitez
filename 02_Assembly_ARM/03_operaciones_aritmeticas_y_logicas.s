.equ SWI_Exit, 0x11

.text
.global _start

_start:
	@ --- Valores iniciales ---
	mov r0, #7		@ Binario: ...00111
	mov r1, #4

	@ --- Aritmética Básica ---
	add r2, r0, r1		@ Suma (7 + 4 = 11)
	sub r3, r0, r1		@ Resta (7 - 4 = 3)
	mul r4, r0, r1		@ Multiplicación (7 * 4 = 28)

	@ --- Lógica Bit a Bit ---
	and r5, r0, r1		@ AND: 0111 & 0100 = 0100 (4). Máscara para borrar bits.
	orr r6, r0, r1		@ OR:  0111 | 0100 = 0111 (7). Máscara para setear bits.
	eor r7, r0, r1		@ XOR: 0111 ^ 0100 = 0011 (3). Invierte bits.

	@ --- Barrel Shifter (Desplazamientos) ---
	@ El segundo operando (r1) dicta cuántos lugares se mueve r0.

	mov r8, r0, lsl r1	@ LSL (Logical Shift Left): Desplazar a izq = Multiplicar por 2^n.
				@ 7 * 2^4 = 112. (Rellena con 0s a la derecha).

	mov r9, r0, lsr r1	@ LSR (Logical Shift Right): Desplazar a der = División entera sin signo.
				@ 7 / 2^4 = 0. (Rellena con 0s a la izquierda).

	mov r10, r0, asr r1	@ ASR (Arithmetic Shift Right): División entera CON signo.
				@ IMPORTANTE: Replica el bit de signo (el más a la izquierda).
				@ Como 7 es positivo, rellena con 0s (igual que LSR).
				@ Si fuera negativo, rellenaría con 1s para mantener el signo.

	swi SWI_Exit
	.end
