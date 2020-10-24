BUILD_DIR = build

hello: $(BUILD_DIR)/hello.o
	ld -o $(BUILD_DIR)/hello $(BUILD_DIR)/hello.o

$(BUILD_DIR)/hello.o: hello.asm
	nasm -f elf64 -o $(BUILD_DIR)/hello.o hello.asm

$(shell   mkdir -p $(BUILD_DIR))

clean:
	rm -r build/
