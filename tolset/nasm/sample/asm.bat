nasm -f elf32 kernel.asm -o kasm.o
i686-elf-gcc -m32 -c kernel.c -o kc.o
i686-elf-ld -m elf_i386 -T link.ld -o kernel kasm.o kc.o
qemu-system-i386 -kernel kernel

@REM /opt/cross/bin/i686-elf-ld --version
