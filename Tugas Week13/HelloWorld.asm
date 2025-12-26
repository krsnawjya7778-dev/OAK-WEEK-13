section .data
    ; ===== Biodata =====
    nama     db "Nama: Krisna Wijaya", 0x0A
    namaLen  equ $ - nama

    nim      db "NIM: 0110225086", 0x0A
    nimLen   equ $ - nim

    prodi    db "Prodi: Teknik Informatika", 0x0A
    prodiLen equ $ - prodi

    ; ===== Teks Operasi =====
    teksTambah db "Hasil 5 + 3 = "
    teksTambahLen equ $ - teksTambah

    teksKurang db 0x0A, "Hasil 8 - 2 = "
    teksKurangLen equ $ - teksKurang

section .bss
    hasil resb 1

section .text
    global _start

_start:
    ; ===== Print Nama =====
    mov eax, 4
    mov ebx, 1
    mov ecx, nama
    mov edx, namaLen
    int 0x80

    ; ===== Print NIM =====
    mov eax, 4
    mov ebx, 1
    mov ecx, nim
    mov edx, nimLen
    int 0x80

    ; ===== Print Prodi =====
    mov eax, 4
    mov ebx, 1
    mov ecx, prodi
    mov edx, prodiLen
    int 0x80

    ; ===== Operasi Tambah (5 + 3) =====
    mov eax, 5
    add eax, 3          ; eax = 8
    add eax, '0'        ; konversi ke ASCII

    mov [hasil], eax

    mov eax, 4
    mov ebx, 1
    mov ecx, teksTambah
    mov edx, teksTambahLen
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, hasil
    mov edx, 1
    int 0x80

    ; ===== Operasi Kurang (8 - 2) =====
    mov eax, 8
    sub eax, 2          ; eax = 6
    add eax, '0'

    mov [hasil], eax

    mov eax, 4
    mov ebx, 1
    mov ecx, teksKurang
    mov edx, teksKurangLen
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, hasil
    mov edx, 1
    int 0x80

    ; ===== Exit =====
    mov eax, 1
    xor ebx, ebx
    int 0x80