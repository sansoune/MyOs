[bits 16]
[org 0x7c00]

boot:
    mov ah, 0x02
    mov al, 0x01
    mov ch, 0x00
    mov cl, 0x02
    mov dh, 0x00
    mov dl, 0x80
    mov bx, 0x1000
    mov es, bx
    int 0x13
    jc disk_error
    mov ah, 0x0e
    mov al, '$'
    mov bh, 0
    int 0x10
    jmp 0x1000:0x00

disk_error:
    mov ah, 0x0e
    mov al, '!'
    mov bh, 0
    int 0x10
    hlt


times (510 - ($ - $$)) db 0
dw 0xaa55