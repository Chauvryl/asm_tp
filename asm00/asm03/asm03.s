global _start

section .data
	msg db "1337", 10


section .text

_start:
        add esp, 8
        mov eax, dword [esp]
        mov bl, byte [eax]
        cmp bl, 0x34
        jne _end_error
        mov bl, byte [eax + 1]
        cmp bl, 0x32
        jne _end_error
        mov bl, byte [eax +2]
        cmp bl, 0
        jne _end_error

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