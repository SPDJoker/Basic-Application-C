# Basic OpenGL Application

This is a starting point for a basic OpenGL application (WIP).

Currently works on Mac.

Uses OpenGL and GLUT.

## Instructions

You can use anything you want to work on this project.
However, to run it you must have access to a terminal.

### Compiling and Building

To compile the project:
```Makefile
$ make all
```

To run the project:
```Makefile
$ make run
```

To clear the bin folder:
```Makefile
$ make clean
```

### Recommended Extensions for VS Code

Here are the plugins I use to work on VS Code:

* C/C++ Intellisense/debugging by Microsoft
* Shader languages support by slevesque
* Makefile Tools by Microsoft

These extensions enable you to better edit while working on the project.
Since you are running the project through Makefiles, you will get some
harmless errors saying header files could not be found. If that is the
case, then Makefile Tools removes them. However, it will not affect
anything in the project.

I recommend you relaunch if you download these extensions.