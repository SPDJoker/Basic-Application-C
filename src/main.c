#include "joker/utils/Debug.h"

#include <glad/glad.h>
#include <GLFW/glfw3.h>

void updateWindow(GLFWwindow *window);
void framebuffer_size_callback(GLFWwindow* window, int width, int height);

int main() {
    // Initializes and configures GLFW
    debugLogc("Initializing GLFW...", DCOLOR_GREEN);
    if (!glfwInit()) {
        debugErr("Failed to initialize GLFW");
        return -1;
    }
    glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 3);
    glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 3);
    glfwWindowHint(GLFW_OPENGL_PROFILE, GLFW_OPENGL_CORE_PROFILE);
#ifdef __APPLE__
    glfwWindowHint(GLFW_OPENGL_FORWARD_COMPAT, GLFW_TRUE);
#endif

    // Creates the window
    debugLogc("Creating window...", DCOLOR_GREEN);
    GLFWwindow* window = glfwCreateWindow(800, 600, "Default Application", NULL, NULL);
    if (window == NULL) {
        debugErr("Failed to create window.");
        glfwTerminate();
        return -1;
    }
    glfwMakeContextCurrent(window);
    glfwSetFramebufferSizeCallback(window, framebuffer_size_callback);

    // Initialize GLAD
    debugLogc("Initializing GLAD...", DCOLOR_GREEN);
    if (!gladLoadGLLoader((GLADloadproc)glfwGetProcAddress)) {
        debugErr("Failed to initialize GLAD");
        return -1;
    }    

    // Rendering Loop
    while (!glfwWindowShouldClose(window)) {
        // Input
        updateWindow(window);

        // Processes events(keys pressed/released, mouse moved etc.)
        glfwSwapBuffers(window);
        glfwPollEvents();
    }

    // Close window and terminate use of all allocated resources
    debugLogc("Closing window...", DCOLOR_YELLOW);
    glfwTerminate();
    return 0;
}

// Processes key inputs and all other events
void updateWindow(GLFWwindow *window) {
    if(glfwGetKey(window, GLFW_KEY_ESCAPE) == GLFW_PRESS)
        glfwSetWindowShouldClose(window, GLFW_TRUE);
}

// Called whenever the window changes size manually.
void framebuffer_size_callback(GLFWwindow* window, int width, int height) {
    debugLogc("Frame resized!", DCOLOR_BLUE);
    glViewport(0, 0, width, height);
}