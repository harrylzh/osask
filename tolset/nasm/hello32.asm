bits 16 ;16 bit mode 
org 0x7c00 ;entry point

boot:
	mov ax, 0x2401
	int 0x15 ; enable A20 bits

	mov ax, 0x3
	int 0x10 ; set vga text mode 3

	cli
	lgdt [gdt_pointer]; load the gdt table
    
	mov eax, cr0
	or eax,0x1 ; set the protected mode bit on special CPU reg cr0
	mov cr0, eax

	jmp CODE_SEG:boot2; long jump to the code segment 32位模式的代码
;gdt table begin-----------------------------------------------------
gdt_start:
	dq 0x0
gdt_code:
	dw 0xFFFF
	dw 0x0
	db 0x0
	db 10011010b
	db 11001111b
	db 0x0
gdt_data:
	dw 0xFFFF
	dw 0x0
	db 0x0
	db 10010010b
	db 11001111b
	db 0x0
gdt_end:
gdt_pointer:
	dw gdt_end - gdt_start
	dd gdt_start

CODE_SEG equ gdt_code - gdt_start
DATA_SEG equ gdt_data - gdt_start
;gdt table end-----------------------------------------------------

bits 32
boot2:
	mov ax, DATA_SEG
	mov ds, ax
	mov es, ax
	mov fs, ax
	mov gs, ax
	mov ss, ax
	mov esi,hello
	mov ebx,0xb8000

.loop:
	lodsb
	or al,al
	jz halt
	or eax,0x0100
	mov word [ebx], ax
	add ebx,2
	jmp .loop

;退出
halt:
	cli
	hlt

hello: db "Hello world!",0


;软盘引导固定
times 510 - ($-$$) db 0
dw 0xaa55