# App Information
BUILD_NAME := Application

# Paths
BIN_DIR	:= ./bin
INC_DIR	:= ./inc
LIB_DIR	:= ./lib
OBJ_DIR	:= ./obj
SRC_DIR	:= ./src

# DO NOT CHANGE ANYTHING BELOW THIS
EXE := $(BIN_DIR)/$(BUILD_NAME)
SRC := $(shell find $(SRC_DIR) -name "*.c")
OBJ := $(SRC:$(SRC_DIR)/%.c=$(OBJ_DIR)/%.o)

# Compiler Settings
CC := gcc
CPPFLAGS := -I$(INC_DIR)/ -MMD -MP
CFLAGS := -Wall -framework OpenGL
LDLIBS :=  -lglfw

# Unix OS Variables
RM := rm

.PHONY: all clean run reload

all: $(EXE)

$(EXE): $(OBJ) | $(BIN_DIR)
	$(CC) $(LDGFLAGS) $(OBJ) $(LDLIBS) -o $@

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c | $(OBJ_DIR)
	mkdir -p $(@D)
	$(CC) $(CPPFLAGS) $(CFLAGS) -c $< -o $@

$(BIN_DIR) $(OBJ_DIR):
	mkdir -p $@

# Delete all object files, along with the executable file.
clean:

	@$(RM) -rv $(BIN_DIR) $(OBJ_DIR)

# Run the executable file, the application.
run:
	$(EXE)

reload: clean all run

-include(OBJ:.o=.d)