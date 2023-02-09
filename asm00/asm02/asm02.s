global _start

section .data
	msg db "1337", 10

section .bss
	buf resb 4

section .text
_start:
	mov eax, 3
	mov ebx, 0
	mov ecx, buf
	mov edx, 3
	int 0x80

	mov al, buf[0]
	mov bl, buf[1]

	mov eax, 4
	mov ebx, 1
	mov ecx, buf
	mov edx, 5
	int 0x80

	mov eax, 1
	mov ebx, 0
	int 0x80
