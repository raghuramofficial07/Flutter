Container(
  // The 'decoration' property allows advanced styling for the container.
  // Think of it like customizing a view with borders, shadows, gradients, etc.
  decoration: BoxDecoration(
    // Sets the background color of the container to green.
    // This replaces the 'color:' property you would otherwise use directly in Container.
    color: Colors.green,

    // Makes the corners of the container rounded with a radius of 20 pixels.
    // Similar to cornerRadius in iOS or borderRadius in CSS.
    borderRadius: BorderRadius.circular(20),

    // Adds a shadow behind the container to give it elevation or depth.
    // Helps create a card-like or raised button effect visually.
    boxShadow: [
      BoxShadow(
        // Shadow color with 30% transparency (black color slightly faded)
        color: Colors.black.withOpacity(0.3),

        // Determines how much the shadow spreads outward.
        spreadRadius: 2,

        // Controls how blurry the shadow appears.
        blurRadius: 4,

        // Moves the shadow slightly down (y = 2), to mimic light coming from above.
        offset: Offset(0, 2),
      ),
    ],
  ),

  // This 'child' is placed inside the container.
  // 'Center' widget is used here to center the Text horizontally and vertically.
  child: Center(
    child: Text('Container with decoration'),
  ),
)
