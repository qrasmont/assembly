BUILD_DIR = build

hello: $(BUILD_DIR)/userinput.o
	ld -o $(BUILD_DIR)/userinput $(BUILD_DIR)/userinput.o

$(BUILD_DIR)/userinput.o: userinput.asm
	nasm -f elf64 -o $(BUILD_DIR)/userinput.o userinput.asm

$(shell   mkdir -p $(BUILD_DIR))

clean:
	rm -r build/
