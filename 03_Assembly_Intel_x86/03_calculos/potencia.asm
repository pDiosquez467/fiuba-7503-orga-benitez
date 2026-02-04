global main
extern pow
extern printf

section .data
    resultado   db  "Resultado: %f", 0x0A, 0x00
    base        dd  8.0     ; Float 32 bits
    exp         dd  2.0     ; Float 32 bits

section .text
main:
    ; Cargar Base (Float -> Double)
    movss       xmm0, [base]
    cvtss2sd    xmm0, xmm0  ; XMM0 = 8.0 (Double)

    ; Cargar Exponente (Float -> Double)
    movss       xmm1, [exp]
    cvtss2sd    xmm1, xmm1  ; XMM1 = 2.0 (Double)

    ; Llamada a pow(xmm0, xmm1) -> Devuelve en xmm0
    sub         rsp, 8
    call        pow
    add         rsp, 8

    mov         rdi, resultado
    mov         rax, 1      ; 1 argumento vectorial

    sub         rsp, 8
    call        printf
    add         rsp, 8

    ret
