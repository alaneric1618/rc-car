module floor() {
    translate([0,0,-3]) cube([100,177.8,3], center=true);
}

module bank() {
    color([0.8,0.5,0]) cube([63.5,57.5,17]);
}

module board() {
    color([1,0.5,0.5]) cube([56.5, 85,36]);
}

module motor() {
    translate([-30,0,0]) rotate([90,0,90]) {
	color([0.8,0.5,0.5]) *cube([25.5,25.5, 60]);
	color([0.8,0.0,0.5]) translate([12.75,12.75,0]) cylinder(r=12.75,h=60);
    }
}

module servo() {
    color([0.8,0.5,0.5]) cube([11.8, 32, 29.5]);
}

module bodyFloor() {
    floor();
    translate([30,-60,40]) rotate(90) bank();
    translate([-30,-40,0])board();
    translate([10,-75,0]) motor();
    translate([10,50,0]) rotate(90) servo();
}

bodyFloor();
