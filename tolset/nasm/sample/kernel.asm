;;kernel.asm

;nasm directive - 32 bit 模式
bits 32
;----------------------------------------
section .text;数据段
        ;multiboot spec
        align 4
        dd 0x1BADB002            ;magic
        dd 0x00                  ;flags
        dd - (0x1BADB002 + 0x00) ;checksum. m+f+c should be zero
;----------------------------------------
global start
extern kmain	        ;kmain is defined in the c file 外部函数定义
;----------------------------------------
start:
  cli 			;block interrupts 禁止中断
  mov esp, stack_space	;set stack pointer 设置栈指针
  call kmain ;调用kmain
  hlt		 	;halt the CPU
;----------------------------------------
section .bss;全局变量段
resb 8192		;8KB for stack
stack_space: