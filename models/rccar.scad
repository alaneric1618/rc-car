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

module upperCrossbar(){
        difference(){
                translate([-30,53,23.5]) cube([60,16,4]);
                //hub holes
                translate([25,57,23.5]) cylinder(r=2.75,h=28, center=true, $fn=50);
                translate([-25,57,23.5]) cylinder(r=2.75,h=28, center=true, $fn=50);
                //servo slit
                translate([0,50+15.5,23.5]) cube([12,1.6,10],center=true);
        }
}

module lowerCrossbar(){
        difference(){
                translate([-25,74,6]) cube([50,10,2]);
                translate([20,79,5.9]) cylinder(7.2,2.75,2.75,$fn=100);
                translate([-20,79,5.9]) cylinder(7.2,2.75,2.75,$fn=100);
                translate([0,79,5.9]) cube([10,5,5],center=true);
        }
}

bodyFloor();
translate([25,57,0])    hubAssembly();
translate([-25,57,0])   scale([-1,1,1])     hubAssembly();
translate([45,57,4])   rotate(90,[0,1,0])  scale(20) wheel(25);
translate([-45,57,4])  rotate(-90,[0,1,0]) scale(20) wheel(25);
largeGear();
axelWheel();
axel();
upperCrossbar();
lowerCrossbar();

