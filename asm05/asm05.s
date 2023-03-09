global _start

section .data
	msg db "1337", 10


section .text

_start:
        add esp, 8
        mov eax, dword [esp]
        mov bl, byte [eax]
        mov bl, byte [eax + 1]
        mov bl, byte [eax +2]
        cmp bl, 0
        jne _end_error
        mov al, bl


        add esp, 8
        mov eax, dword [esp]
        mov bl, byte [eax]
        mov bl, byte [eax + 1]
        mov bl, byte [eax +2]
        cmp bl, 0
        jne _end_error
        add al,bl

_end:

        mov eax, 4
        mov ebx,1
        mov ecx, msg
        mov edx, 5
        int 0x80

        mov eax, 1
        mov ebx, 0
        int 0x80

_end_error:

        mov eax, 1
        mov ebx, 1
        int 0x80