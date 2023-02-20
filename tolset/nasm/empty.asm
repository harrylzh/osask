;启用16位模式
bits 16 ; tell NASM this is 16 bit code 
;第一个扇区开始位置 7c00
org 0x7c00 ; tell NASM to start outputting stuff at offset 0x7c00

boot:
; mov si,hello ; point si register to hello label memory location
;     mov ah,0x0e ; 0x0e means 'Write Character in TTY mode'

; .loop:
;     lodsb
;     or al,al ; is al == 0 ?
;     jz halt  ; if (al == 0) jump to halt label
;     int 0x10 ; runs BIOS interrupt 0x10 - Video Services 
;     jmp .loop

halt:
    cli ; clear interrupt flag
    hlt ; halt execution

; hello: db "Hello world change!",0

;16位模式仅加载前512个字节
times 510 - ($-$$) db 0 ; pad remaining 510 bytes with zeroes
;软盘启动的标记,最后两个字节为0xaa55,就跳转到0x7C00加载程序
dw 0xaa55 ; magic bootloader magic - marks this 512 byte sector bootable! AA55签名



