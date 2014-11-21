use<ballJointMale.scad>
//Comment

$fn = 60;
//hingePin
module hingePinEnd() {
    difference() {
        translate([0,0,0]) cylinder(3,5,5);
        union() {
            translate([3.5,0,-0.1]) cylinder(3.2,1,1);
            translate([-3.5,0,-0.1]) cylinder(3.2,1,1);
            translate([0,3.5,-0.1]) cylinder(3.2,1,1);
            translate([0,-3.5,-0.1]) cylinder(3.2,1,1);
        }
    }
}
//hub post
module hubPost(){
    difference(){
		translate([0,0,4]) rotate([0,90,0]) cylinder(30,3.15,3.15);
		translate([28,4,4]) rotate([90,0,0]) cylinder(h=8, r=.8);
	}
}
//hub cylinder
module hubCylinder(){
    cylinder(23.5,7.5,7.5);
	difference(){
    		translate([0,0,-6])cylinder(36.5,2.5,2.5);
		translate([-4,0,28.5]) rotate([0,90,0]) cylinder(h=8, r=.8);
		translate([-4,0,-4]) rotate([0,90,0]) cylinder(h=8, r=.8);
	}
}
//steering Arm
module steeringArm(){
    translate([-5,0,6])rotate([0,90,0]) cube([4,20,10]);
    translate([-2,12,6])rotate([-90,0,45]) cube([10,4,15]);
	translate([-5,22,5.9]) cylinder(7.1,2.5,2.5);
}
//hub assembly
module hubAssembly(){
    //translate([0,0,-6]) hingePinEnd();
    //translate([0,0,23]) hingePinEnd();
    hubPost();
    hubCylinder();
    steeringArm();
}

hubAssembly();