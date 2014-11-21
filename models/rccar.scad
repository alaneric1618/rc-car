use<bodyfloor.scad>
use<bodyfloor.scad>
use<hubAssembly.scad>
use<wheel.scad>
use<shell.scad>

bodyFloor();
translate([45,55,10])   rotate(90,[0,1,0])  scale(20) wheel(40);
translate([-45,55,10])  rotate(-90,[0,1,0]) scale(20) wheel(40);
translate([45,-55,10])  rotate(90,[0,1,0])  scale(20) wheel(40);
translate([-45,-55,10]) rotate(-90,[0,1,0]) scale(20) wheel(40);
translate([25,55,0])    hubAssembly();
translate([-25,55,0])   scale([-1,1,1])     hubAssembly();
//%scale([0.254,-0.254,0.254]) shell();
