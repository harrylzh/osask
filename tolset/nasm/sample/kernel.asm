;;kernel.asm

;nasm directive - 32 bit ģʽ
bits 32
;----------------------------------------
section .text;���ݶ�
        ;multiboot spec
        align 4
        dd 0x1BADB002            ;magic
        dd 0x00                  ;flags
        dd - (0x1BADB002 + 0x00) ;checksum. m+f+c should be zero
;----------------------------------------
global start
extern kmain	        ;kmain is defined in the c file �ⲿ��������
;----------------------------------------
start:
  cli 			;block interrupts ��ֹ�ж�
  mov esp, stack_space	;set stack pointer ����ջָ��
  call kmain ;����kmain
  hlt		 	;halt the CPU
;----------------------------------------
section .bss;ȫ�ֱ�����
resb 8192		;8KB for stack
stack_space: