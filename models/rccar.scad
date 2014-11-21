use<bodyfloor.scad>
use<bodyfloor.scad>
use<hubAssembly.scad>
use<wheel.scad>
use<shell.scad>
use<gears.scad>

module largeGear() {
    translate([40,-62.5,23]) difference() {
        rotate(90, [0,0,90]) gear(teeth=60);
        translate([-20,-13,-13]) scale(1.02) motor(true);
    }
}

module axel() {
    shift=10;
    translate([0,-30.25,-23]) translate([40,-62.5,23]) {
        rotate(20, [1,0,0]) rotate(90, [0,0,90]) gear(inner=9, outer=11, teeth=20);
        difference() {
            rotate(90,[0,1,0])  scale(20) wheel(80);
            cube([6,50,50],center=true);
        }
    }
    //Shaft
    difference() {
        translate([-shift/2,-30.25,-23]) translate([0,-62.5,23]) rotate(90,[0,-1,0]) cylinder(r=3.15,h=100+shift, $fn=100,center=true);
        translate([-58,-92.75,-5]) cylinder(r=0.8,h=10,$fn=100);
    }
    //Glue
    translate([47,-30.25,-23]) translate([0,-62.5,23]) rotate(90,[0,-1,0]) cylinder(r=6,h=15, $fn=100,center=true);
}


module axelWheel() {
    translate([0,-30.25,-23]) translate([-40,-62.5,23]) {
      rotate(-90,[0,1,0])  scale(20) wheel(80);
      //Shaft
      translate([2.2,0,0]) rotate(-90,[0,1,0]) color([0.6,0.15,0.15]) difference() {
          cylinder(r=5.0,h=15.6,$fn=100);
          translate([0,0,-2.0]) cylinder(r=3.4,h=19.6,$fn=100);
      }
    }
}


bodyFloor();
//translate([45,55,10])   rotate(90,[0,1,0])  scale(20) wheel(40);
//translate([-45,55,10])  rotate(-90,[0,1,0]) scale(20) wheel(40);

//translate([-45,-55,10]) rotate(-90,[0,1,0]) scale(20) wheel(40);
translate([25,55,0])    hubAssembly();
translate([-25,55,0])   scale([-1,1,1])     hubAssembly();

largeGear();
axelWheel();
axel();


//scale([0.254,-0.254,0.254]) shell();

