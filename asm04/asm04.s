global _start

section .bss
    buf resb 3

section .text

_start:
    ; Afficher un message d'invite pour l'utilisateur
    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, len_msg
    int 0x80

    ; Lire deux caractères de l'entrée de l'utilisateur
    mov eax, 3
    mov ebx, 0
    mov ecx, buf
    mov edx, 2
    int 0x80

    ; Convertir les caractères en nombre entier
    mov eax, 0
    mov al, byte [buf]
    sub eax, 48
    mov ebx, 10
    mul ebx
    mov ebx, eax
    mov eax, 0
    mov al, byte [buf+1]
    sub eax, 48
    add eax, ebx

    ; Déterminer si le nombre est pair ou impair
    mov ebx, 2
    xor edx, edx
    div ebx
    cmp edx, 0
    je _pair
    jmp _impaire

_pair:
    ; Afficher le message "pair"
    mov eax, 4
    mov ebx, 1
    mov ecx, msg_pair
    mov edx, len_msg_pair
    int 0x80
    ; Terminer le programme
    mov eax, 1
    mov ebx, 0
    int 0x80

_impaire:
    ; Afficher le message "impair"
    mov eax, 4
    mov ebx, 1
    mov ecx, msg_impaire
    mov edx, len_msg_impaire
    int 0x80
    ; Terminer le programme
    mov eax, 1
    mov ebx, 1
    int 0x80

section .data
    msg db "Entrez un nombre à deux chiffres : ", 0
    len_msg equ $-msg
    msg_pair db "Le nombre est pair.", 0
    len_msg_pair equ $-msg_pair
    msg_impaire db "Le nombre est impair.", 0
    len_msg_impaire equ $-msg_impaire
