// Tidegrow Garden
// Copyright (c) 2022 Lone Dynamics Corporation. All rights reserved.

$fn = 36;

tidegrow_garden_tray();

translate([0,0,-res_height-20])
	tidegrow_garden_res();

with_ports = true;

tray_width = 100;
tray_length = 100;
tray_height = 50;
tray_wall = 2.5;

tray_lip = 3.5;
tray_lip_height = 2.5;

tray_ring = 2.5;
tray_ring_height = 2.5;
tray_radius = 7.5;

res_height = 75;

port_width = 40;
port_height = 6;

module tidegrow_garden_tray()
{
	
	difference() {
		
		union() {
			
			color([0.5,0.5,0.5])
				translate([tray_lip, tray_lip])
					roundedcube(tray_width-(tray_lip*2), tray_length-(tray_lip*2), tray_height-tray_lip, tray_radius);
			
			translate([0, 0, tray_lip_height])
				roundedcube(tray_width, tray_length, tray_height, tray_radius);


		}

		if (with_ports) {	
			// accessory port holes			
			rotate([90,0,0]) {
				translate([tray_width/2+10, tray_lip_height+tray_height-5, -tray_wall-5])
					cylinder(d=3.2, h=50);
				translate([tray_width/2-10, tray_lip_height+tray_height-5, -tray_wall-5])
					cylinder(d=3.2, h=50);
			}
			// accessory port holes
			rotate([90,0,0]) {
				translate([tray_width/2+10, tray_lip_height+tray_height-5, -tray_width-5])
					cylinder(d=3.2, h=50);
				translate([tray_width/2-10, tray_lip_height+tray_height-5, -tray_width-5])
					cylinder(d=3.2, h=50);
			}
			
			rotate([90,0,90]) {
				translate([tray_width/2+10, tray_lip_height+tray_height-5, -tray_wall-5])
					cylinder(d=3.2, h=50);
				translate([tray_width/2-10, tray_lip_height+tray_height-5, -tray_wall-5])
					cylinder(d=3.2, h=50);
			}
			rotate([90,0,90]) {
				translate([tray_width/2+10, tray_lip_height+tray_height-5, tray_width-5])
					cylinder(d=3.2, h=50);
				translate([tray_width/2-10, tray_lip_height+tray_height-5, tray_width-5])
					cylinder(d=3.2, h=50);
			}
		}
	
		translate([tray_wall+tray_ring, tray_wall+tray_ring, tray_lip_height+tray_wall+0.1])
			roundedcube(tray_width-(tray_wall*2)-(tray_ring*2),
				tray_length-(tray_wall*2)-(tray_ring*2),
				tray_height-tray_wall, tray_radius);
		
		translate([tray_wall, tray_wall, tray_lip_height+tray_wall+tray_ring_height+0.1])
			roundedcube(tray_width-(tray_wall*2),tray_length-(tray_wall*2),
					tray_height-tray_wall, tray_radius);
	
		// pump hole
		translate([12.5,12.5,10])
			cylinder(d=9, h=tray_height+10, center=true);
		
		// primary drain hole
		translate([tray_width-12.5,tray_length-12.5,10])
			cylinder(d=9, h=tray_height+10, center=true);

		// secondary drain hole
		translate([12.5,tray_length-12.5,10])
			cylinder(d=2.5, h=tray_height+10, center=true);
		
		
	}

}

module tidegrow_garden_res()
{
	
	difference() {
		
		union() {
			
			color([0.5,0.5,0.5])
				roundedcube(tray_width, tray_length, res_height, tray_radius);

		}

		translate([tray_wall+tray_ring, tray_wall+tray_ring, tray_lip_height+tray_wall+0.1])
			roundedcube(tray_width-(tray_wall*2)-(tray_ring*2),
				tray_length-(tray_wall*2)-(tray_ring*2),
				res_height-tray_wall, tray_radius);
		
		translate([tray_wall, tray_wall, tray_lip_height+tray_wall+tray_ring_height+0.1])
			roundedcube(tray_width-(tray_wall*2),tray_length-(tray_wall*2),
					res_height-tray_wall, tray_radius);

		// pump cable channel
		translate([tray_width-10,tray_length/2,res_height])
			rotate([90,0,90])
				cylinder(d=12.5, h=tray_height+10, center=true);
	
	}

}
	
// https://gist.github.com/tinkerology/ae257c5340a33ee2f149ff3ae97d9826
module roundedcube(xx, yy, height, radius)
{
    translate([0,0,height/2])
    hull()
    {
        translate([radius,radius,0])
        cylinder(height,radius,radius,true);

        translate([xx-radius,radius,0])
        cylinder(height,radius,radius,true);

        translate([xx-radius,yy-radius,0])
        cylinder(height,radius,radius,true);

        translate([radius,yy-radius,0])
        cylinder(height,radius,radius,true);
    }
}