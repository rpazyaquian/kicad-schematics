 module cylinderOuter(height, radius, fn) {
   fudge = 1/cos(180/fn);
   cylinder(height, radius*fudge, $fn=fn);
 }


module drawPanel(n=2) {
    height = 133.35;
    horizontal_pitch = 5.08;
    hole_radius = 1.6;
    depth = 1.75;

    function width(incr, hp) = (incr * hp) - 0.2;

    function hole_center_x(incr, hp) = 7.45 + (incr * hp);
    function hole_center_y(h) = abs(h - 3);

    holes = [
        [hole_center_x(0, horizontal_pitch), hole_center_y(0)],  // bottom left
        [hole_center_x(0, horizontal_pitch), hole_center_y(height)], // top left
        [hole_center_x((n-3), horizontal_pitch), hole_center_y(0)], // bottom right
        [hole_center_x((n-3), horizontal_pitch), hole_center_y(height)]  // top right
    ];
    
    difference() {
        cube([width(n, horizontal_pitch), height, depth]);
        for (hole = holes)
            translate([hole.x, hole.y, 0])
                cylinderOuter((depth*2) + 1, hole_radius, 16);
    }
}

drawPanel(10);