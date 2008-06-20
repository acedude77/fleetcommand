#!/usr/bin/perl -w 
   
 
use OpenGL; 
 
### Initialization function 
sub glInit { 
 
    # Create the viewport 
    glpOpenWindow(); 

    # Define the view frustum 
    glMatrixMode( GL_PROJECTION ); 
    glFrustum(-1.0, 1.0, -1.0, 1.0, 1.0, 20); 

    # Prepare to specify objects!
    glMatrixMode( GL_MODELVIEW ); 
} 

### Display callback 
sub display { 

    # Make sure we're smooth-shading now, so 
    # we can to blend the colors of the 
     # background polygon. 
    glShadeModel( GL_SMOOTH ); 

    # Draw graded black->blue polygon first 
    glBegin( GL_POLYGON ); 
    glColor3f( 0, 0, 0 ); 
    glVertex3f( -20, 20, -19 ); 
    glVertex3f( 20, 20, -19 ); 
    glColor3f( 0, 0, 1 ); 
    glVertex3f( 20, -20, -19 ); 
    glVertex3f( -20, -20, -19 ); 
    glEnd(); 

    glFlush(); 
    glXSwapBuffers(); 
} 
 
### Main body of program 

glInit(); 
display(); 

print "Press return to exit\n"; 

while ( <> ) { 
    exit; 
} 
