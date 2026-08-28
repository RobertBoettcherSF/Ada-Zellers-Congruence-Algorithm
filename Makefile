.PHONY: all test clean

GNAT = gnatmake
OBJ_DIR = obj
BIN_DIR = bin

all: $(BIN_DIR)/tests

$(BIN_DIR)/tests: tests.adb zeller.ads zeller.adb
	mkdir -p $(OBJ_DIR)$(BIN_DIR)
	# Build the project using the GNAT project file
	$(GNAT) -P zeller_project.gpr

test: all
	@echo "Running tests..."
	@./$(BIN_DIR)/tests

clean:
	rm -rf $(OBJ_DIR)/*$(BIN_DIR)/*
