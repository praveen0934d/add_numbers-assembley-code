; ==========================================
; MULTIBOOT HEADER
; ==========================================

; 1. Tell the assembler to drop this into a specific section
section .multiboot

; 2. Define the exact constants for the GRUB handshake
MAGIC    equ  0x1BADB002
FLAGS    equ  0x00000003
CHECKSUM equ -(MAGIC + FLAGS)

; 3. Physically carve these 32-bit values into the binary
; 'dd' stands for Define Double-word (4 bytes / 32 bits)
dd MAGIC
dd FLAGS
dd CHECKSUM