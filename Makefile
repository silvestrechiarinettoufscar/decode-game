# Toolchains
CC = gcc
RISCV_PREFIX = riscv64-linux-gnu
AS = $(RISCV_PREFIX)-as
LD = $(RISCV_PREFIX)-ld
OBJDUMP = $(RISCV_PREFIX)-objdump

# Flags
CFLAGS = -Wall -O2

# Arquivos
ASM = riscv.asm
OBJ = riscv.o
ELF = riscv.elf
DUMP = riscv.dump
TXT = riscv.txt
GEN = encoding
SRC = main.c
ADD = arquivoquefalaoi.c
SRC += $(ADD)
.PHONY: all run clean

# Alvo padrão
all: run 

# Compila o programa C
$(GEN): $(SRC)
	$(CC) $(CFLAGS) -o $@ $(SRC)

# Executa o programa sempre que make for chamado
run: $(GEN) $(ASM)
	./$(GEN)

# Limpeza
clean:
	rm -f $(GEN) $(OBJ) $(ELF) $(DUMP) $(TXT)
