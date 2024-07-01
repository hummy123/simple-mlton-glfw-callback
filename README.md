# GLFW callback example

This is a working example of setting a GLFW key callback with MLton.

## Building the program

You must first have GLFW, pkg-config and the MLton compiler installed on your computer to build this program.

Once those are installed, building on a Linux/BSD machine is simple with the following steps:

- Clone this repository
- Enter `./build-unix.sh` in a terminal open at the repository root
- `./shell` to executed the compiled program

## How the callback is set in code

The following steps were taken to define and set the callback in code:

- In ffi/glfw-export.c:
  - Lines 36 - 38 declare a callback function with the prototype described by [GLFWkeyfun](https://www.glfw.org/docs/3.3/group__input.html#ga5bd751b27b90f865d2ea613533f0453c) (for key callbacks).
  - Line 37 is where the C callback function calls a function exported from MLton
  - Lines 41 - 43 pass off the window and the callback function (from lines 36 - 38) to GLFW, to set it as a callback

- In ffi/glfw-import.sml:
  - Line 17 exports a function name and its type
  - Line 18 declares the implementation for this exported function
  - Line 21 imports the `setKeyCallback` from `glfw-export.c` and declares it as `reentrant`.
    - The reentrant attribute is important and means that the C function imported calls an SML function that was exported to C
