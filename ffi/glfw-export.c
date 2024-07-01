#include "export.h"
#include <GLFW/glfw3.h>
#include <stdbool.h>

// GLFW functions used below
void init() {
  glfwInit();
}

GLFWwindow* createWindow(int width, int height, const char *title) {
  return glfwCreateWindow(width, height, title, NULL, NULL);
}

void terminate() {
  glfwTerminate();
}

void makeContextCurrent(GLFWwindow* window) {
  glfwMakeContextCurrent(window);
}

bool windowShouldClose(GLFWwindow *window) {
  glfwWindowShouldClose(window);
}

void pollEvents() {
  glfwPollEvents();
}

void swapBuffers(GLFWwindow *window) {
  glfwSwapBuffers(window);
}

// Key callback function defined in C,
// which calls a function exported from MLton.
void keyCallback(GLFWwindow *window, int a, int b, int c, int d) {
  printFromMLton();
}

// Sets a key callback.
void setKeyCallback(GLFWwindow *window) {
  glfwSetKeyCallback(window, keyCallback);
}
