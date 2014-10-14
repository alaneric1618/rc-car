use<bodyfloor.scad>
use<hubAssembly.scad>
bodyFloor();
translate([40,80,21])rotate([180,0,0])rightHubAssembly();
translate([-40,80,1])rotate([0,0,180])leftHubAssembly();
