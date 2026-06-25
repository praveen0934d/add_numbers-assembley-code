; ==========================================
; THE IGNITION SWITCH (boot.asm)
; ==========================================
global _start

; --- 1. CARVE PHYSICAL RAM FOR THE STACK ---
section .bss
align 16
stack_bottom:
    resb 16384      ; Reserve 16 Kilobytes of contiguous RAM (16 * 1024)
stack_top:

; --- 2. THE MASTER ENTRY POINT ---
section .text
_start:
    ; The CPU is now executing our code. 
    ; Immediately bolt the 32-bit stack pointer (ESP) to the top of our reserved RAM.
    mov esp, stack_top

    ; --- KERNEL LOGIC GOES HERE LATER ---
    ; (e.g., Calling your C/Rust kernel, setting up 64-bit mode)

    ; --- 3. THE DEAD LOOP (PREVENT EXECUTION INTO THE VOID) ---
    ; If your kernel ever finishes or crashes, the CPU will just keep reading 
    ; the next memory addresses, executing random garbage, and crash the machine.
    ; We must forcefully lock the CPU in an unescapable room.
    
    cli             ; Clear Interrupts (Deafen the CPU to all hardware signals)
.hang:
    hlt             ; Halt the CPU (Put the silicon to sleep)
    jmp .hang       ; If it somehow wakes up, instantly jump back to sleep