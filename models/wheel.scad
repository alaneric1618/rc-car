inchestomm = 25.4;
inches = 6;
quality=50;

//2 units in each direction
module wheel(res) {
    $fn=res;
    treadPoly = [[0,0], [0.1,0.1], [0.1, 0]];
    translate([0,0,0]) rotate([0,0,0]) union() {
        difference() {
            hull() {
                cylinder(r1=0.8,r2=0.9,h=0.1);
                for (i=[0.1:0.1:0.8]) {
                    translate([0,0,i]) cylinder(r=0.9+(0.1*sin(180*i)), h=0.1);
                }
                translate([0,0,0.9]) cylinder(r1=0.9,r2=0.8,h=0.1);
            }
            translate([0,0,0.8]) {
                scale([0.85,0.85,1])rotate_extrude() polygon([[0,0],[0.63,0],[0.64,0.05],[0.68,0.1],[0.73,0.15],[0.73,0.3],[0,0.3]]);
            }
            scale([1,1,-3.6]) translate([0,0,-0.2]) {
                scale([0.85,0.85,1])rotate_extrude() polygon([[0,0],[0.63,0],[0.64,0.05],[0.68,0.1],[0.73,0.15],[0.73,0.3],[0,0.3]]);
            }
            translate([0,0,0.6]) union($fn=30) {
                rotate([0,0,0]) linear_extrude(height = 0.5, center = true, convexity = 10, twist = 240)   translate([0.3, 0, 0]) scale([1.5,2.5,1])  circle(r = 0.1, $fn=20);
                rotate([0,0,120]) linear_extrude(height = 0.5, center = true, convexity = 10, twist = 240) translate([0.3, 0, 0]) scale([1.5,2.5,1])  circle(r = 0.1, $fn=20);
                rotate([0,0,240]) linear_extrude(height = 0.5, center = true, convexity = 10, twist = 240) translate([0.3, 0, 0]) scale([1.5,2.5,1])  circle(r = 0.1, $fn=20);
            }
            for (theta=[0:30:360]) {
                rotate([0,0,theta]) linear_extrude(height = 1, convexity = 10, twist = 40) translate([0.94, 0, 0]) scale([1.5,2.5,1]) minkowski() polygon(treadPoly) square(size= 0.07, $fn=20);
            }

        }
        translate([0,0,0.75]) cylinder(r=0.08,h=0.1,$fn=5);
        difference() {
            cylinder(r=0.15,h=0.78);
            translate([0,0,-0.1]) cylinder(r=0.12,h=0.78);
        }
    }
}

//1 units in each direction
module body(res) {
    $fn=res;
    cube([0.5,1,0.025], center=true);
}

//scale(inchestomm*inches) body(quality);
//scale(inchestomm*inches) wheel(quality);
scale(20) wheel(100);
