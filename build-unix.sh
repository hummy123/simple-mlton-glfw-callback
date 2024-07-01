mlton -link-opt "$(pkg-config --cflags glfw3) $(pkg-config --static --libs glfw3)" -export-header ffi/export.h shell.mlb ffi/glfw-export.c
