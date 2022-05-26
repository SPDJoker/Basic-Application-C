# Basic OpenGL Application

This is a starting point for a basic OpenGL application (WIP).

Currently works on Mac.

Uses OpenGL, GLFW, and Glew.

## Instructions

You can use any IDE you want to work on this project.
However, to run it you must have access to a terminal or 
something campable of running Makefiles.

### Compiling and Building

To compile the project:
```Makefile
$ make all
```

To run the compiled project:
```Makefile
$ make run
```

To clear the output files:
```Makefile
$ make clean
```

To recompile and run:
```Makefile
$ make reload
```

## Recommended for VS Code

### Extensions
Here are the plugins I use to work on VS Code:

* C/C++ Intellisense/debugging by Microsoft
* Shader languages support by slevesque

The C/C++ extension will show an error reading header
files in the editor. However, the program still works.

If you would like to fix it then you have to go to
settings and search for **browse.path** and add:
```
"${workspaceFolder}/inc"
```