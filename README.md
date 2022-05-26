# Basic OpenGL Application

This is a starting point for a basic OpenGL application (WIP).

Currently works on Mac.

Uses OpenGL and GLUT.

## Instructions

This project is designed to be edited and run with Visual Studio Code.

Install [Visual Studio Code](https://code.visualstudio.com)

### Recommended Extensions

Install these plugins for VS Code:

* C/C++ Intellisense/debugging by Microsoft
* Shader languages support by slevesque
* Makefile Tools by Microsoft

These extensions enable you to better edit while working on the project.
Since you are running the project through Makefiles, you will get some
harmless errors saying header files could not be found. If that is the
case, then Makefile Tools removes them. However, it will not affect
anything in the project.

### Compiling and Building

To compile the project:
> $ make all

To run the project:
> $ make run

To clear the bin folder:
> $ make clean