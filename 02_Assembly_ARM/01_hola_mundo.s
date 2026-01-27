@ --------------------------------------------------------------------------
@ SECCIÓN DE CONSTANTES (DIRECTIVAS)
@ --------------------------------------------------------------------------
@ .equ define constantes simbólicas para hacer el código más legible.
@ No generan código máquina, solo es un "buscar y reemplazar" para el ensamblador.
.equ SWI_Print_String, 0x02   @ Servicio 0x02: Imprimir cadena en consola
.equ SWI_Exit, 0x11           @ Servicio 0x11: Terminar el programa (Exit)

@ --------------------------------------------------------------------------
@ SECCIÓN DE DATOS (.data)
@ --------------------------------------------------------------------------
@ Aquí se definen las variables y constantes que ocupan espacio en memoria RAM.
.data

cadena:
    @ .asciz guarda la cadena de caracteres seguida de un byte nulo (0x00).
    .asciz "Hola Mundo!\n"

@ --------------------------------------------------------------------------
@ SECCIÓN DE CÓDIGO (.text)
@ --------------------------------------------------------------------------
@ Aquí van las instrucciones que ejecutará el procesador.
.text
    .global _start

_start:
    @ PASO 1: Cargar la dirección del mensaje
    @ 'ldr r0, =etiqueta' es una pseudo-instrucción que carga la dirección completa de 32 bits.
    ldr r0, =cadena

    @ PASO 2: Llamar al sistema para imprimir
    @ El procesador mira el valor en r0, luego mira el número de servicio (0x02) y ejecuta.
    swi SWI_Print_String
    swi SWI_Exit

.end
