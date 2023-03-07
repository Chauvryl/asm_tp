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
	cmp al, '4';
	jne _error

	mov bl, buf[1]
	cmp bl,'2';
	jne _error

	mov bl, buf[2]
	cmp bl,10;
	jne _error


	mov eax, 4
	mov ebx,1
	mov ecx, msg
	mov edx, 5
	int 0x80

	mov eax, 1
	mov ebx, 0
	int 0x80

_error:
	mov eax, 1
	mov ebx, 1
	int 0x80
