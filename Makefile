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
SRC_C := $(shell find $(SRC_DIR) -name "*.c")
OBJ_C := $(SRC_C:$(SRC_DIR)/%.c=$(OBJ_DIR)/%.o)
SRC_CXX := $(shell find $(SRC_DIR) -name "*.cpp")
OBJ_CXX := $(SRC_CXX:$(SRC_DIR)/%.cpp=$(OBJ_DIR)/%.o)

# Compiler Settings
CC := gcc
CXX := g++
CPPFLAGS := -I$(INC_DIR)/ -MMD -MP
CFLAGS := -Wall -framework OpenGL
CXXFLAGS := -Wall -framework OpenGL
LDLIBS :=  -lglfw

# Unix OS Variables
RM := rm

.PHONY: all clean run reload

all: $(EXE)

# Executable
$(EXE): $(OBJ_C) $(OBJ_CXX) | $(BIN_DIR)
	$(CXX) $(LDGFLAGS) $(OBJ_C) $(OBJ_CXX) $(LDLIBS) -o $@

# C Object Files
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c | $(OBJ_DIR)
	mkdir -p $(@D)
	$(CC) $(CPPFLAGS) $(CFLAGS) -c $< -o $@

# CPP Object Files
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.cpp | $(OBJ_DIR)
	mkdir -p $(@D)
	$(CXX) $(CPPFLAGS) $(CXXFLAGS) -c $< -o $@

# Create Missing Build Directory
$(BIN_DIR) $(OBJ_DIR):
	mkdir -p $@

# Delete Output Directories.
clean:

	@$(RM) -rv $(BIN_DIR) $(OBJ_DIR)

# Run Executable.
run:
	$(EXE)

# Complete Rebuild and Execute
reload: clean all run

-include(OBJ_CXX:.o=.d)