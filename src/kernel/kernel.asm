[org 0]
[bits 16]


mov ax, cs
mov ds, ax
mov es, ax 
mov ax, 0x7000
mov ss, ax
mov sp, ss



start:
    mov al, 03h
    mov ah, 0
    int 10h

    _mouser:
        mov ah, 02h
        mov dl, bl
        mov dh, cl
        int 10h
        mov ah, 00h
        int 16h

        cmp al, 08h
        je _backspace
        cmp al, 09h
        jge _print
        cmp al, 07h
        jae _print
        jmp _mouser

    _backspace:
        sub bl, 1h 
        jmp _backspace2

    _backspace2:
        mov ah, 0eh
        mov al, 20h
        int 10h
        jmp _mouser

    _down:
        add cl, 1h
        jmp _mouser

    _up:
        sub cl, 1h 
        jmp _mouser

    _left:
        sub bl, 1h 
        jmp _mouser

    _right:
        add bl, 1h
        jmp _mouser

    _print:
        mov ah, 0eh
        cmp al, 0Dh
        je _down
        int 10h
        jmp _right

ret

times (512 - ($ - $$)) db 0
dw 0xaa55