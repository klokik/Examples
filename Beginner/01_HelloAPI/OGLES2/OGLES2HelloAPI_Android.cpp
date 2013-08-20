/*!****************************************************************************
 @File          OGLES2HelloAPI_Android.cpp

 @Title         OpenGL ES 2.0 HelloAPI Tutorial

 @Copyright     Copyright (C) by Imagination Technologies Limited.

 @Platform      Android

 @Description   Basic Tutorial that shows step-by-step how to initialize
				OpenGL ES 2.0, use it for drawing a triangle and terminate it.

				This tutorial contains a platform specific part that may need
				modification before you can run it on a certain platform.

				Important resources for OpenGL ES 2.0 development can be found at
				http://www.khronos.org/opengles/
******************************************************************************/
#include <stdio.h>

#include <EGL/egl.h>
#include <GLES2/gl2.h>

#include <android/log.h>
#include <android/window.h>
#include <android_native_app_glue.h>

/******************************************************************************
 Defines
******************************************************************************/

// Index to bind the attributes to vertex shaders
#define VERTEX_ARRAY	0

/******************************************************************************
 Structs
******************************************************************************/
struct SHelloAPIData
{
	// EGL variables
	EGLDisplay			eglDisplay;
	EGLSurface			eglSurface;
	EGLContext			eglContext;


	GLuint uiFragShader, uiVertShader;		// Used to hold the fragment and vertex shader handles
	GLuint uiProgramObject;					// Used to hold the program handle (made out of the two previous shaders
	GLuint ui32Vbo;

	bool bAnimating;
	struct android_app* pApp;
};

/*!****************************************************************************
 @Function		TestEGLError
 @Input			pszLocation		location in the program where the error took
								place. ie: function name
 @Return		bool			true if no EGL error was detected
 @Description	Tests for an EGL error and prints it
******************************************************************************/
bool TestEGLError(const char* pszLocation)
{
	/*
		eglGetError returns the last error that has happened using egl,
		not the status of the last called function. The user has to
		check after every single egl call or at least once every frame.
	*/
	EGLint iErr = eglGetError();
	if (iErr != EGL_SUCCESS)
	{
		__android_log_print(ANDROID_LOG_ERROR,"OGLES2HelloAPI", "%s failed (%d).\n", pszLocation, iErr);
		return false;
	}

	return true;
}

/*!****************************************************************************
 @Function		main
 @Input			argc		Number of arguments
 @Input			argv		Command line arguments
 @Return		int			result code to OS
 @Description	Main function of the program
******************************************************************************/
bool InitAPI(SHelloAPIData &data)
{
	// EGL variables
	EGLConfig			eglConfig	= 0;

	/*
		EGL has to create a context for OpenGL ES. Our OpenGL ES resources
		like textures will only be valid inside this context
		(or shared contexts).
		Creation of this context takes place at step 7.
	*/
	EGLint ai32ContextAttribs[] = { EGL_CONTEXT_CLIENT_VERSION, 2, EGL_NONE };

	// Matrix used for projection model view (PMVMatrix)
	float pfIdentity[] =
	{
		1.0f,0.0f,0.0f,0.0f,
		0.0f,1.0f,0.0f,0.0f,
		0.0f,0.0f,1.0f,0.0f,
		0.0f,0.0f,0.0f,1.0f
	};

	// Fragment and vertex shaders code
	const char* pszFragShader = "\
		void main (void)\
		{\
			gl_FragColor = vec4(1.0, 1.0, 0.66 ,1.0);\
		}";

	const char* pszVertShader = "\
		attribute highp vec4	myVertex;\
		uniform mediump mat4	myPMVMatrix;\
		void main(void)\
		{\
			gl_Position = myPMVMatrix * myVertex;\
		}";

	/*
		Step 2 - Get the default display.
		EGL uses the concept of a "display" which in most environments
		corresponds to a single physical screen. Since we usually want
		to draw to the main screen or only have a single screen to begin
		with, we let EGL pick the default display.
		Querying other displays is platform specific.
	*/

	data.eglDisplay = eglGetDisplay((EGLNativeDisplayType) EGL_DEFAULT_DISPLAY);

	/*
		Step 3 - Initialize EGL.
		EGL has to be initialized with the display obtained in the
		previous step. We cannot use other EGL functions except
		eglGetDisplay and eglGetError before eglInitialize has been
		called.
		If we're not interested in the EGL version number we can just
		pass NULL for the second and third parameters.
	*/
	EGLint iMajorVersion, iMinorVersion;

	if (!eglInitialize(data.eglDisplay, &iMajorVersion, &iMinorVersion))
	{
		__android_log_print(ANDROID_LOG_ERROR,"OGLES2HelloAPI", "Error: eglInitialize() failed.\n");
		return false;
	}

	/*
		Make OpenGL ES the current API.
		EGL provides ways to set up OpenGL ES and OpenVG contexts
		(and possibly other graphics APIs in the future), so we need
		to specify the "current API".
	*/
	eglBindAPI(EGL_OPENGL_ES_API);

	if (!TestEGLError("eglBindAPI"))
	{
		return false;
	}

	/*
		Step 4 - Specify the required configuration attributes.
		An EGL "configuration" describes the pixel format and type of
		surfaces that can be used for drawing.
		For now we just want to use a 16 bit RGB surface that is a
		Window surface, i.e. it will be visible on screen. The list
		has to contain key/value pairs, terminated with EGL_NONE.
	 */
	EGLint pi32ConfigAttribs[11];
	pi32ConfigAttribs[0] = EGL_RED_SIZE;
	pi32ConfigAttribs[1] = 5;
	pi32ConfigAttribs[2] = EGL_GREEN_SIZE;
	pi32ConfigAttribs[3] = 6;
	pi32ConfigAttribs[4] = EGL_BLUE_SIZE;
	pi32ConfigAttribs[5] = 5;
	pi32ConfigAttribs[6] = EGL_SURFACE_TYPE;
	pi32ConfigAttribs[7] = EGL_WINDOW_BIT;
	pi32ConfigAttribs[8] = EGL_RENDERABLE_TYPE;
	pi32ConfigAttribs[9] = EGL_OPENGL_ES2_BIT;
	pi32ConfigAttribs[10] = EGL_NONE;

	// Get a config that match our criteria
	EGLint num_config;

	if(!eglChooseConfig(data.eglDisplay, pi32ConfigAttribs, &eglConfig, 1, &num_config) || num_config != 1)
	{
		return false;
	}

	EGLint visualID;
	eglGetConfigAttrib(data.eglDisplay, eglConfig, EGL_NATIVE_VISUAL_ID, &visualID);

	// Change the format of our window to match our config
    ANativeWindow_setBuffersGeometry(data.pApp->window, 0, 0, visualID);

	/*
		Step 6 - Create a surface to draw to.
		Use the config picked in the previous step and the native window
		handle when available to create a window surface. A window surface
		is one that will be visible on screen inside the native display (or
		fullscreen if there is no windowing system).
		Pixmaps and pbuffers are surfaces which only exist in off-screen
		memory.
	*/
	data.eglSurface = eglCreateWindowSurface(data.eglDisplay, eglConfig, data.pApp->window, NULL);

	if (!TestEGLError("eglCreateWindowSurface"))
	{
		return false;
	}

	/*
		Step 7 - Create a context.
	*/
	data.eglContext = eglCreateContext(data.eglDisplay, eglConfig, NULL, ai32ContextAttribs);
	if (!TestEGLError("eglCreateContext"))
	{
		return false;
	}

	/*
		Step 8 - Bind the context to the current thread and use our
		window surface for drawing and reading.
		Contexts are bound to a thread. This means you don't have to
		worry about other threads and processes interfering with your
		OpenGL ES application.
		We need to specify a surface that will be the target of all
		subsequent drawing operations, and one that will be the source
		of read operations. They can be the same surface.
	*/
	eglMakeCurrent(data.eglDisplay, data.eglSurface, data.eglSurface, data.eglContext);

	if (!TestEGLError("eglMakeCurrent"))
	{
		return false;
	}

	/*
		Step 9 - Draw something with OpenGL ES.
		At this point everything is initialized and we're ready to use
		OpenGL ES to draw something on the screen.
	*/

	// Create the fragment shader object
	data.uiFragShader = glCreateShader(GL_FRAGMENT_SHADER);

	// Load the source code into it
	glShaderSource(data.uiFragShader, 1, (const char**)&pszFragShader, NULL);

	// Compile the source code
	glCompileShader(data.uiFragShader);

	// Check if compilation succeeded
	GLint bShaderCompiled;
    glGetShaderiv(data.uiFragShader, GL_COMPILE_STATUS, &bShaderCompiled);

	if (!bShaderCompiled)
	{
		// An error happened, first retrieve the length of the log message
		int i32InfoLogLength, i32CharsWritten;
		glGetShaderiv(data.uiFragShader, GL_INFO_LOG_LENGTH, &i32InfoLogLength);

		// Allocate enough space for the message and retrieve it
		char* pszInfoLog = new char[i32InfoLogLength];
        glGetShaderInfoLog(data.uiFragShader, i32InfoLogLength, &i32CharsWritten, pszInfoLog);

		// Displays the error
		__android_log_print(ANDROID_LOG_ERROR,"OGLES2HelloAPI", "Failed to compile fragment shader: %s\n", pszInfoLog);
		delete [] pszInfoLog;
		return false;
	}

	// Loads the vertex shader in the same way
	data.uiVertShader = glCreateShader(GL_VERTEX_SHADER);
	glShaderSource(data.uiVertShader, 1, (const char**)&pszVertShader, NULL);
	glCompileShader(data.uiVertShader);
    glGetShaderiv(data.uiVertShader, GL_COMPILE_STATUS, &bShaderCompiled);

	if (!bShaderCompiled)
	{
		int i32InfoLogLength, i32CharsWritten;
		glGetShaderiv(data.uiVertShader, GL_INFO_LOG_LENGTH, &i32InfoLogLength);
		char* pszInfoLog = new char[i32InfoLogLength];
        glGetShaderInfoLog(data.uiVertShader, i32InfoLogLength, &i32CharsWritten, pszInfoLog);
		__android_log_print(ANDROID_LOG_ERROR,"OGLES2HelloAPI", "Failed to compile vertex shader: %s\n", pszInfoLog);
		delete [] pszInfoLog;
		return false;
	}

	// Create the shader program
    data.uiProgramObject = glCreateProgram();

	// Attach the fragment and vertex shaders to it
    glAttachShader(data.uiProgramObject, data.uiFragShader);
    glAttachShader(data.uiProgramObject, data.uiVertShader);

	// Bind the custom vertex attribute "myVertex" to location VERTEX_ARRAY
    glBindAttribLocation(data.uiProgramObject, VERTEX_ARRAY, "myVertex");

	// Link the program
    glLinkProgram(data.uiProgramObject);

	// Check if linking succeeded in the same way we checked for compilation success
    GLint bLinked;
    glGetProgramiv(data.uiProgramObject, GL_LINK_STATUS, &bLinked);

	if (!bLinked)
	{
		int ui32InfoLogLength, ui32CharsWritten;
		glGetProgramiv(data.uiProgramObject, GL_INFO_LOG_LENGTH, &ui32InfoLogLength);
		char* pszInfoLog = new char[ui32InfoLogLength];
		glGetProgramInfoLog(data.uiProgramObject, ui32InfoLogLength, &ui32CharsWritten, pszInfoLog);
		__android_log_print(ANDROID_LOG_ERROR,"OGLES2HelloAPI", "Failed to link program: %s\n", pszInfoLog);
		delete [] pszInfoLog;
		return false;
	}

	// Actually use the created program
    glUseProgram(data.uiProgramObject);

	// Sets the clear color.
	// The colours are passed per channel (red,green,blue,alpha) as float values from 0.0 to 1.0
	glClearColor(0.6f, 0.8f, 1.0f, 1.0f); // clear blue

	// We're going to draw a triangle to the screen so create a vertex buffer object for our triangle
	{
		// Interleaved vertex data
		GLfloat afVertices[] = {	-0.4f,-0.4f,0.0f, // Position
								0.4f ,-0.4f,0.0f,
								0.0f ,0.4f ,0.0f};

		// Generate the vertex buffer object (VBO)
		glGenBuffers(1, &data.ui32Vbo);

		// Bind the VBO so we can fill it with data
		glBindBuffer(GL_ARRAY_BUFFER, data.ui32Vbo);

		// Set the buffer's data
		unsigned int uiSize = 3 * (sizeof(GLfloat) * 3); // Calc afVertices size (3 vertices * stride (3 GLfloats per vertex))
		glBufferData(GL_ARRAY_BUFFER, uiSize, afVertices, GL_STATIC_DRAW);
	}

	/*
		Bind the projection model view matrix (PMVMatrix) to
		the associated uniform variable in the shader
	*/

	// First gets the location of that variable in the shader using its name
	int i32Location = glGetUniformLocation(data.uiProgramObject, "myPMVMatrix");

	// Then passes the matrix to that variable
	glUniformMatrix4fv(i32Location, 1, GL_FALSE, pfIdentity);

	/*
		Enable the custom vertex attribute at index VERTEX_ARRAY.
		We previously binded that index to the variable in our shader "vec4 MyVertex;"
	*/
	glEnableVertexAttribArray(VERTEX_ARRAY);

	// Sets the vertex data to this attribute index
	glVertexAttribPointer(VERTEX_ARRAY, 3, GL_FLOAT, GL_FALSE, 0, 0);

	// Setup the viewport
	EGLint w,h;
	eglQuerySurface(data.eglDisplay, data.eglSurface, EGL_WIDTH,  &w);
	eglQuerySurface(data.eglDisplay, data.eglSurface, EGL_HEIGHT, &h);
	glViewport(0,0,w,h);

	return true;
}

bool DeInitAPI(SHelloAPIData &data)
{
	// Frees the OpenGL handles for the program and the 2 shaders
	glDeleteProgram(data.uiProgramObject);
	glDeleteShader(data.uiFragShader);
	glDeleteShader(data.uiVertShader);

	// Delete the VBO as it is no longer needed
	glDeleteBuffers(1, &data.ui32Vbo);

	/*
		The window is being hidden or closed, Terminate OpenGL ES.
		eglTerminate takes care of destroying any context or surface created
		with this display, so we don't need to call eglDestroySurface or
		eglDestroyContext here.
	*/
	eglMakeCurrent(data.eglDisplay, EGL_NO_SURFACE, EGL_NO_SURFACE, EGL_NO_CONTEXT) ;
	eglTerminate(data.eglDisplay);
	return true;
}

/*
	Process the next main command.
*/
static void handle_cmd(struct android_app* app, int32_t cmd)
{
    struct SHelloAPIData* data = (struct SHelloAPIData*) app->userData;

    switch (cmd)
    {
        case APP_CMD_INIT_WINDOW:
            // The window is being shown, get it ready.
            if (data->pApp->window != NULL)
            {
				InitAPI(*data);
            }
            break;

        case APP_CMD_TERM_WINDOW:
        	DeInitAPI(*data);
            break;
        case APP_CMD_GAINED_FOCUS:
            data->bAnimating = true;
            break;
        case APP_CMD_LOST_FOCUS:
            data->bAnimating = false;
            break;
    }
}


/*
	This is the main entry point of a native application that is using
	android_native_app_glue.  It runs in its own thread, with its own
	event loop for receiving input events and doing other things.
*/
void android_main(struct android_app* state)
{
    SHelloAPIData data;
	memset(&data, 0, sizeof(SHelloAPIData));

    // Make sure glue isn't stripped.
    app_dummy();

    state->userData = &data;
    state->onAppCmd = handle_cmd;
    data.pApp = state;

    for(;;)
    {
        // Read all pending events.
        int ident;
        int events;
        struct android_poll_source* source;

        // If not animating, we will block forever waiting for events.
        // If animating, we loop until all events are read, then continue
        // to draw the next frame of animation.
        while((ident=ALooper_pollAll(data.bAnimating ? 0 : -1, NULL, &events, (void**)&source)) >= 0)
        {
            // Process this event.
            if (source != NULL)
            {
                source->process(state, source);
            }

            // Check if we are exiting.
            if (state->destroyRequested != 0)
            {
                DeInitAPI(data);
                return;
            }
        }

        if(data.bAnimating)
        {
			/*
				Clears the color buffer.
				glClear() can also be used to clear the depth or stencil buffer
				(GL_DEPTH_BUFFER_BIT or GL_STENCIL_BUFFER_BIT)
			*/
			glClear(GL_COLOR_BUFFER_BIT);

			/*
				Draws a non-indexed triangle array from the pointers previously given.
				This function allows the use of other primitive types : triangle strips, lines, ...
				For indexed geometry, use the function glDrawElements() with an index list.
			*/
			glDrawArrays(GL_TRIANGLES, 0, 3);

			/*
				Swap Buffers.
				Brings to the native display the current render surface.
			*/
			eglSwapBuffers(data.eglDisplay, data.eglSurface);
        }
    }
}

/******************************************************************************
 End of file (OGLES2HelloAPI_Android.cpp)
******************************************************************************/
