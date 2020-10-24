BUILD_DIR = build

printsub: $(BUILD_DIR)/printsub.o
	ld -o $(BUILD_DIR)/printsub $(BUILD_DIR)/printsub.o

$(BUILD_DIR)/printsub.o: printsub.asm
	nasm -f elf64 -o $(BUILD_DIR)/printsub.o printsub.asm

$(shell   mkdir -p $(BUILD_DIR))

clean:
	rm -r build/
