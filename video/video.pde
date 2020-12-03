// Step 1. Import the video library.
import processing.video.*;

//Step 2. Declare a capture object.
Capture video;

// Step 5. Read from the camera when a new image is available!
void captureEvent(Capture video) {
  video.read();
}

void setup() {  
  size(320, 240);
  
  // Step 3. Initialize Capture object.
  video = new Capture(this, 256, 256);
  
  // Step 4. Start the capturing process.
  video.start();
}

// Step 6. Display the image.
void draw() {  
image(video, 0, 0);
}
