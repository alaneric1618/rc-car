module floor() {
    difference() {
        translate([0,0,-1.5]) cube([100,177.8,3], center=true);
        //tire holes
        translate([50,-55,0]) rotate(90,[0,1,0]) cylinder(r=35,h=28, center=true);
        translate([50,55,0]) rotate(90,[0,1,0]) cylinder(r=35,h=28, center=true);
        translate([-50,-55,0]) rotate(90,[0,1,0]) cylinder(r=35,h=28, center=true);
        translate([-50,55,0]) rotate(90,[0,1,0]) cylinder(r=35,h=28, center=true);
        //hub holes
        translate([25,55,0]) cylinder(r=2.75,h=28, center=true, $fn=50);
        translate([-25,55,0]) cylinder(r=2.75,h=28, center=true, $fn=50);
        //servo slit
        translate([0,48+15.5,0]) cube([12,1.6,10],center=true);
    }
}

module bank() {
    color([0.8,0.5,0]) cube([64.5,59,12], center=true);
}

module board() {
    color([1,0.5,0.5]) cube([59, 85,36], center=true);
}

module motor(shaft=false) {
    translate([-30,0,0]) rotate([90,0,90]) {
        color([0.8,0.5,0.5]) *cube([25.5,25.5, 60]);
        color([0.8,0.0,0.5]) translate([12.75,12.75,0]) cylinder(r=13.75,h=43, $fn=75);
        if (shaft) difference() {
            color([0.0,0.0,0.5]) translate([12.75,12.75,1]) cylinder(r=2,h=54, $fn=75);
            color([0.0,0.0,0.5]) translate([8,13.75,47]) cube([9,9,9], $fn=75);
        }
    }
}

module servo() {
    color([0.8,0.5,0.5]) cube([12, 32, 29.5]);
}

module bodyFloor() {
    union() {
        floor();
        // BANK HOLDER
        translate([0,-11,0]) union() {
            // Bank Holder
            translate([0,0,40]) difference() {
                scale(1.2) translate([0,0,0]) rotate(90) bank();
                translate([0,0,4]) rotate(90) bank();
                translate([33,0,9]) rotate(30,[0,1,0]) cube([15,100,10],center=true);
                translate([-33,0,9]) rotate(-30,[0,1,0]) cube([15,100,10],center=true);
                translate([39,0,2]) rotate(70,[0,1,0]) cube([15,100,10],center=true);
                translate([-39,0,2]) rotate(-70,[0,1,0]) cube([15,100,10],center=true);
                translate([-31,17,2]) cube([10,10,10],center=true);
            }
            //Legs
            translate([-32,35,20]) cube([3,3,41], center=true);
            translate([32,35,20]) cube([3,3,41], center=true);
            translate([-32,-35,20]) cube([3,3,41], center=true);
            translate([32,-35,20]) cube([3,3,41], center=true);
            translate([32,0,22]) rotate(72, [1,0,0]) cube([3,3,72], center=true);
            translate([32,0,22]) rotate(-72, [1,0,0]) cube([3,3,72], center=true);
            translate([-32,0,22]) rotate(72, [1,0,0]) cube([3,3,72], center=true);
            translate([-32,0,22]) rotate(-72, [1,0,0]) cube([3,3,72], center=true);
        }
        // BOARD HOLDER
        translate([0,0,5]) difference() {
            scale([1.17,1.1,0.3]) board();
            translate([0,0,0]) board();
            translate([0,38,2]) rotate(30,[1,0,0]) cube([58.8,20,10], center=true);
        }
        // MOTOR
        translate([25,0,0]) union() {
            difference() {
                hull() {
                    translate([-15,-62.5,23]) rotate(90,[0,1,0]) cylinder(r=17, h=50, center=true, $fn=100);
                }
                translate([-14,-62.5,23]) rotate(90,[0,1,0]) cylinder(r=14, h=50, center=true);
                translate([-18,-62.5,23]) rotate(90,[0,1,0]) cylinder(r=4, h=50, center=true);
                translate([-18,-72.5,23]) rotate(90,[0,1,0]) cylinder(r=2.5, h=50, center=true);
                translate([-18,-52.5,23]) rotate(90,[0,1,0]) cylinder(r=2.5, h=50, center=true);
                for (i = [0:6]) translate([-35+(i*6),-85,2]) cube([3,50,50]);
            }
            //translate([-5,-75,10]) motor(true);
            translate([-38,-64,38]) cube([46,3,3]);
            translate([-38,-81,20]) cube([46,3,3]);
            translate([-38,-66,-1]) cube([46,5,9]);
        }
        // SERVO
        //translate([-5.9,50,0]) servo();
        translate([-8,55,5]) cube([4,10,6],center=true);
        translate([8,55,5]) cube([4,10,6],center=true);

    }
}

bodyFloor();
