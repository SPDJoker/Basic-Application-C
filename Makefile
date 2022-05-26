# App Information
BUILDNAME		:= APP

# Paths
ROOTDIR			:= .
BUILDDIR		:= ./bin
INCLUDEDIR		:= ./include
SOURCEDIR		:= ./source

# Compiler Settings
CC 				:= clang
CFLAGS1 		:= -framework OpenGL -framework GLUT
CFLAGS2 		:= -Wall -Werror -Wno-deprecated-declarations

# DO NOT CHANGE ANYTHING BELOW THIS
TARGET 			:= $(BUILDDIR)/$(BUILDNAME)
SOURCE			:= $(SOURCEDIR)/%.c
OBJECT			:= $(BUILDDIR)/%.o

SOURCES 		:= $(shell find $(SOURCEDIR) -name "*.c")
OBJECTS			:= $(subst $(SOURCEDIR),$(BUILDDIR),$(SOURCES:.c=.o))

#$(addsuffix /inc/,$(addprefix -I,$(LINKERDIR)/*))
INCLUDES		:= -I$(INCLUDEDIR)/

# Dependency Settings
DEPENDENCIES		:= $(OBJECTS:.o=.d)
-include $(DEPENDENCIES)

DEPFLAGS 		= -MMD -MF $(@:.o=.d)

all: $(TARGET)

$(TARGET): $(OBJECTS)
	$(CC) $(CFLAGS1) -o $@ $^

$(OBJECT): $(SOURCE)
	mkdir -p $(@D)
	$(CC) $(CFLAGS2) $(INCLUDES) -o $@ -c $<

# Delete all object files, along with the executable file.
clean:
	rm -rf $(BUILDDIR)/*

# Run the executable file, the application.
run:
	$(TARGET)