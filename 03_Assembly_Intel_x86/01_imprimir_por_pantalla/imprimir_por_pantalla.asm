extern puts                 ; Declaramos que 'puts' es un símbolo externo

section .data
    mensaje db  "Organización del Computador", 0

section .text
    global main             ; Exportamos 'main' para que GCC (el linker) sepa dónde empezar.

main:
    ; Cargamos la dirección de memoria de 'mensaje' en RDI.
    mov rdi, mensaje

    ; Al entrar a 'main', la pila está desalineada en 8 bytes (por el RIP pusheado al llamar main).
    ; La ABI requiere que RSP sea múltiplo de 16 antes de un 'call'.
    ; RSP actual termina en ...8 -> Restamos 8 -> RSP termina en ...0 (Alineado).
    sub rsp, 8

    call puts               ; Llama a puts(rdi). Imprime el string + un salto de línea (\n).

    ; Devolvemos la pila a su estado original (balanceo de pila).
    add rsp, 8

    ; Retornamos el control al C Runtime.
    ret
