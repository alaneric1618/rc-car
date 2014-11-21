pi = 3.141592;
rtod = 57.2957795;

module gear(inner=27, outer=29, depth=4, teeth=30.0, toothThinning=0.55) {
    circ=2*pi*inner;
    outer=outer-inner;
    toothBase=circ/teeth;
    tooth = [
        [-(toothBase/2), -inner/10],
        [-(toothBase/2), 0],
        [-(toothBase/2)*toothThinning, outer],
        [+(toothBase/2)*toothThinning, outer],
        [+(toothBase/2), 0],
        [+(toothBase/2), -inner/10],
    ];
    for (theta = [0:2*(toothBase/inner)*rtod: 2*pi*rtod]) {
        rotate(theta, [0,1,0]) translate([0,0,inner])
        rotate(90, [1,0,0]) translate([0,0,-depth/2]) linear_extrude(depth) polygon(tooth);
    }
    translate([0,0,0]) rotate(90, [1,0,0]) cylinder(r=inner, h=depth, center=true, $fn=100);
}

rotate(($t*200)/3.0,[0,1,0]) gear(inner=27, outer=29, teeth=60);
rotate(0,[0,1,0]) translate([0,2,38.2]) rotate(14,[0,1,0]) rotate(-200*$t,[0,1,0]) gear(inner=9, outer=11, teeth=20);
