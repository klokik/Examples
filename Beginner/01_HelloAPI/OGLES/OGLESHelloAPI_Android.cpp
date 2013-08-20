/*!****************************************************************************
 @File          OGLESHelloAPI_Android.cpp

 @Title         OpenGL ES 1.x HelloAPI Tutorial

 @Copyright     Copyright (C) by Imagination Technologies Limited.

 @Platform      Linux

 @Description   Basic Tutorial that shows step-by-step how to initialize
				OpenGL ES 1.x, use it for drawing a triangle and terminate it.

				This tutorial contains a platform specific part that may need
				modification before you can run it on a certain platform.

				Important resources for OpenGL ES 1.x development can be found at
				http://www.khronos.org/opengles/
******************************************************************************/
#include <stdio.h>

#include <EGL/egl.h>
#include <GLES/gl.h>

#include <android/log.h>
#include <android/window.h>
#include <android_native_app_glue.h>

/******************************************************************************
 Defines
******************************************************************************/

/******************************************************************************
 Structs
******************************************************************************/
struct SHelloAPIData
{
	// EGL variables
	EGLDisplay			eglDisplay;
	EGLSurface			eglSurface;
	EGLContext			eglContext;

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
		__android_log_print(ANDROID_LOG_ERROR,"OGLESHelloAPI", "%s failed (%d).\n", pszLocation, iErr);
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
		Get the default display.
		EGL uses the concept of a "display" which in most environments
		corresponds to a single physical screen. Since we usually want
		to draw to the main screen or only have a single screen to begin
		with, we let EGL pick the default display.
		Querying other displays is platform specific.
	*/

	data.eglDisplay = eglGetDisplay((EGLNativeDisplayType) EGL_DEFAULT_DISPLAY);

	/*
		Initialize EGL.
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
		__android_log_print(ANDROID_LOG_ERROR,"OGLESHelloAPI", "Error: eglInitialize() failed.\n");
		return false;
	}


	/*
		Specify the required configuration attributes.
		An EGL "configuration" describes the pixel format and type of
		surfaces that can be used for drawing.
		For now we just want to use a 16 bit RGB surface that is a
		Window surface, i.e. it will be visible on screen. The list
		has to contain key/value pairs, terminated with EGL_NONE.
	 */
	EGLint pi32ConfigAttribs[9];
	pi32ConfigAttribs[0] = EGL_RED_SIZE;
	pi32ConfigAttribs[1] = 5;
	pi32ConfigAttribs[2] = EGL_GREEN_SIZE;
	pi32ConfigAttribs[3] = 6;
	pi32ConfigAttribs[4] = EGL_BLUE_SIZE;
	pi32ConfigAttribs[5] = 5;
	pi32ConfigAttribs[6] = EGL_SURFACE_TYPE;
	pi32ConfigAttribs[7] = EGL_WINDOW_BIT;
	pi32ConfigAttribs[8] = EGL_NONE;

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
		Create a surface to draw to.
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
		Create a context.
		EGL has to create a context for OpenGL ES. Our OpenGL ES resources
		like textures will only be valid inside this context
		(or shared contexts)
	*/
	data.eglContext = eglCreateContext(data.eglDisplay, eglConfig, NULL, NULL);
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

	// Sets the clear color.
	// The colours are passed per channel (red,green,blue,alpha) as float values from 0.0 to 1.0
	glClearColor(0.6f, 0.8f, 1.0f, 1.0f); // clear blue

	// We're going to draw a triangle to the screen so create a vertex buffer object for our triangle
	{
		// Interleaved vertex data
		GLfloat afVertices[] = {	-0.4f,-0.4f,0.0f, 		// Position
								1.0f ,1.0f ,0.66f,1.0f, // Colour
								+0.4f,-0.4f,0.0f,
								1.0f ,1.0f ,0.66f,1.0f,
								0.0f ,0.4f ,0.0f,
								1.0f ,1.0f ,0.66f,1.0f};

		// Generate the vertex buffer object (VBO)
		glGenBuffers(1, &data.ui32Vbo);

		// Bind the VBO so we can fill it with data
		glBindBuffer(GL_ARRAY_BUFFER, data.ui32Vbo);

		// Set the buffer's data
		unsigned int uiSize = 3 * (sizeof(GLfloat) * 7); // Calc afVertices size (3 vertices * stride (7 verttypes per vertex (3 pos + 4 color)))
		glBufferData(GL_ARRAY_BUFFER, uiSize, afVertices, GL_STATIC_DRAW);
	}

	// Enable vertex arrays
	glEnableClientState(GL_VERTEX_ARRAY);

	/*
		Set the vertex pointer.
		param 1: Number of coordinates per vertex; must be 2, 3, or 4.
		param 2: GL_FIXED for CommonLite and GL_FLOAT for Common profile.
		param 3: Specifies the byte offset between consecutive vertexes.
		param 4: Offset to the start of the first vertex into the VBO.
	*/

	glVertexPointer(3, GL_FLOAT, sizeof(float) * 7, 0);

	// Set color data in the same way
	glEnableClientState(GL_COLOR_ARRAY);
	glColorPointer(4,GL_FLOAT,sizeof(float) * 7, (GLvoid*) (sizeof(float) * 3) /*The colour starts after the 3 position values (x,y,z)*/);
	
	EGLint w,h;
	eglQuerySurface(data.eglDisplay, data.eglSurface, EGL_WIDTH,  &w);
	eglQuerySurface(data.eglDisplay, data.eglSurface, EGL_HEIGHT, &h);

	/*
		Done - activate requested features
	*/
	glViewport(0,0,w,h);

	return true;
}

bool DeInitAPI(SHelloAPIData &data)
{
	// Delete the VBO as it is no longer needed
	glDeleteBuffers(1, &data.ui32Vbo);

	/*
		Terminate OpenGL ES.
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
				param 1: Primitive type: GL_POINTS, GL_LINES, GL_TRIANGLE_STRIP, GL_TRIANGLE_FAN, GL_TRIANGLES, etc.
				param 2: The starting index in the array.
				param 3: The number of indices to be rendered.
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
 End of file (OGLESHelloAPI_Android.cpp)
******************************************************************************/
