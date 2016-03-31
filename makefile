
CFLAGS = -Wall
DFLAGS = -Wall -g -DDEBUG=1

SRC_DIR = ./src
BIN_DIR = ./bin

MAIN = $(SRC_DIR)/app.c $(SRC_DIR)/engine.c $(SRC_DIR)/matrix.c
EXEC = tp0

all: release

# Compilación normal
release: $(MAIN)
	@echo -e '\e[0;32m=> \e[1;31mCompilando objetivo $@\e[m'
	mkdir -p $(BIN_DIR)
	gcc $(MAIN) -o $(BIN_DIR)/$(EXEC) $(CFLAGS)

# Compilación debug
debug: $(MAIN)
	@echo -e '\e[0;32m=> \e[1;31mCompilando objetivo $@\e[m'
	mkdir -p $(BIN_DIR)
	gcc $(MAIN) -o $(BIN_DIR)/$(EXEC) $(DFLAGS)

# Ejecución normal
run:
	@echo -e '\e[0;32m=> \e[1;31mEjecutando programa...\e[m'
	$(BIN_DIR)/$(EXEC)

# Ejecución debug (requiere Valgrind)
debugrun:
	@echo -e '\e[0;32m=> \e[1;31mEjecutando ConcuPort en modo DEBUG...\e[m'
	valgrind --leak-check=full --show-leak-kinds=all --track-origins=yes $(BIN_DIR)/$(EXEC)


.PHONY: clean

clean:
	rm -rf $(BIN_DIR)/*
