.PHONY: all clean

all: sectors.bin loader.bin
	@cat loader.bin sectors.bin > os.bin

sectors.bin: sectors.asm
	@nasm -f bin sectors.asm -o sectors.bin

loader.bin: loader.asm
	@nasm -f bin loader.asm -o loader.bin

run:
	@qemu-system-i386 -fda os.bin

clean:
	@rm -rf *.bin
