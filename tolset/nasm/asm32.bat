@REM nasm -f elf boot4.asm -o boot4.o
@REM gcc -m32
@REM i386-elf-_g++ x86_64-elf-g++ -m64 kmain.cpp boot4.o -o kernel.bin -nostdlib -ffreestanding -std=c++11 -mno-red-zone -fno-exceptions -nostdlib -fno-rtti -Wall -Wextra -Werror -T linker.ld
@REM /opt/bin/i686-w64-mingw32-g++ -m32 kmain.cpp boot4.o -o kernel.bin -nostdlib -ffreestanding -std=c++11 -mno-red-zone -fno-exceptions -nostdlib -fno-rtti -Wall -Wextra -Werror -T linker.ld
@REM  /opt/bin/i686-w64-mingw32-g++.exe

@REM /opt/bin/i686-w64-mingw32-g++ -nostdlib -ffreestanding -c -o kmain.o kmain.cpp
/opt/bin/i686-w64-mingw32-ld  -o boot1.tmp kmain.o boot4.o

