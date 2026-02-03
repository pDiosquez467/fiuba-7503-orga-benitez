; constantes
LEN_BUFFER      equ 128
LEN_PADRON      equ 64
LEN_EDAD        equ 10

extern fgets
extern puts
extern printf
extern stdin

section .data
    ; Strings de formato y mensajes
    fmt_resultado   db  "El alumno %s %s de Padrón N° %s tiene %s años", 10, 0 
    
    msg_nombre      db "Nombre:",0
    msg_apellido    db "Apellido:",0
    msg_padron      db "Padrón:",0
    msg_edad        db "Edad:",0

section .bss
    ; Buffers de memoria
    buf_nombre      resb LEN_BUFFER
    buf_apellido    resb LEN_BUFFER
    buf_padron      resb LEN_PADRON
    buf_edad        resb LEN_EDAD

section .text
    global main

main:
    mov rdi, msg_nombre         ; Arg1: Mensaje
    mov rsi, buf_nombre         ; Arg2: Buffer destino
    mov rdx, LEN_BUFFER         ; Arg3: Tamaño
    call solicitar_dato

    mov rdi, msg_apellido
    mov rsi, buf_apellido
    mov rdx, LEN_BUFFER
    call solicitar_dato

    mov rdi, msg_padron
    mov rsi, buf_padron
    mov rdx, LEN_PADRON
    call solicitar_dato

    mov rdi, msg_edad
    mov rsi, buf_edad
    mov rdx, LEN_EDAD
    call solicitar_dato

    mov rdi, fmt_resultado
    mov rsi, buf_nombre
    mov rdx, buf_apellido
    mov rcx, buf_padron
    mov r8,  buf_edad
    xor eax, eax                ; RAX = 0

    sub rsp, 8
    call printf
    add rsp, 8

    ret

; Descripción: Imprime un prompt, lee entrada segura y limpia el enter.
;   RDI = Dirección del mensaje (prompt)
;   RSI = Dirección del buffer de destino
;   RDX = Tamaño del buffer
solicitar_dato:
    push rbp
    mov rbp, rsp
    push rbx
    push r12

    ; Guardamos los argumentos en registros seguros antes de llamar a puts
    ; (porque puts destruirá RDI, RSI y RDX)
    mov rbx, rsi
    mov r12, rdx

    sub rsp, 8
    call puts
    add rsp, 8

    mov rdi, rbx                ; Buffer -> RDI
    mov rsi, r12                ; Tamaño -> RSI
    mov rdx, [stdin]            ; Stream -> RDX

    sub rsp, 8
    call fgets
    add rsp, 8

    mov rdi, rbx
    call borrar_enter

    pop r12
    pop rbx
    pop rbp
    ret

; Descripción: Reemplaza la primera ocurrencia de '\n' (0x0A) por '\0'
borrar_enter:
    mov al, 10                  ; Buscamos el ASCII 10 (\n)
.loop:
    cmp byte [rdi], 0
    je .fin
    cmp byte [rdi], al
    je .found
    inc rdi
    jmp .loop

.found:
    mov byte [rdi], 0           ; Reemplazar por NULL

.fin:
    ret
