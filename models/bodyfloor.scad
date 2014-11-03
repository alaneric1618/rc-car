module floor() {
    translate([0,0,-1.5]) cube([100,177.8,3], center=true);
}

module bank() {
    color([0.8,0.5,0]) cube([63.5,57.5,17], center=true);
}

module board() {
    color([1,0.5,0.5]) cube([56.5, 85,36], center=true);
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
    union() {
        floor();
        // Bank Holder And Legs
        translate([0,-11,0]) union() {
            // Bank Holder
            translate([0,0,50]) difference() {
                scale(1.2) translate([0,0,0]) rotate(90) bank();
                translate([0,0,4]) rotate(90) bank();
            }
            //Legs
            translate([-32,35,20]) cube([3,3,41], center=true);
            translate([32,35,20]) cube([3,3,41], center=true);
            translate([-32,-35,20]) cube([3,3,41], center=true);
            translate([32,-35,20]) cube([3,3,41], center=true);
        }
        // Board Holder
        translate([0,0,5]) difference() {
            scale([1.17,1.1,0.3]) board();
            translate([0,0,0]) board();
        }
        translate([10,-75,0]) motor();
        translate([10,50,0]) rotate(90) servo();
    }
}

bodyFloor();
