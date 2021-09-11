BOOTLOADER = src/bootlaoder/bootloader.asm
KERNEL = src/kernel/kernel.asm


build: clean
	mkdir -p build
	nasm ${BOOTLOADER} -f bin -o build/bootloader.bin
	nasm ${KERNEL} -f bin -o build/kernel.bin
	cat build/bootloader.bin build/kernel.bin > build/OS.bin


publish: 
	git add .
	git commit -m "$(text)"
	git push -u MyOs root


clean:
	rm -rf build

