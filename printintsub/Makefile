BUILD_DIR = build

printintsub: $(BUILD_DIR)/printintsub.o
	ld -o $(BUILD_DIR)/printintsub $(BUILD_DIR)/printintsub.o

$(BUILD_DIR)/printintsub.o: printintsub.asm
	nasm -f elf64 -o $(BUILD_DIR)/printintsub.o printintsub.asm

$(shell   mkdir -p $(BUILD_DIR))

clean:
	rm -r build/
