include<../../libs/nema17_motor.scad>
include<../../libs/tslot.scad>

total_height =8+10; // last parameter is bolt length
outer_diameter = 60;
hole_dia=10;

rotate(a=90,v=[0,1,0]) 
case();

//translate(v=[1,0,35]) wheel();

//rotate(a=90,v=[0,1,0]) translate([-22,24,-40]) tslot20holes(100);
//rotate(a=90,v=[0,1,0])
//translate(v=[1,-2,7]) motor_mount();	


//hopper();



module motor_mount(){
	difference(){	
		union(){
			#translate(v=[-5,29.5,4.5]) cube(size=[42+30,7.0,5], center=true);	 
			translate(v=[-5,1,20]) cube(size=[42+30,42+10,9], center=true);	 
			translate(v=[-5,21,2+18/2]) cube(size=[42+30,10,18], center=true);	 
		}
		// direct mount to t-slot
		translate([16,28,0]){
			 cube([6,2.3,10]);
		  	 translate([3,6,5]) #rotate(a=90,v=[1,0,0]) cylinder(r=2,h=8);
		}
		translate([16-40,28,0]){
			 cube([6,2.3,10]);
		  	 translate([3,6,5]) #rotate(a=90,v=[1,0,0]) cylinder(r=2,h=8);
		}


		// DC motor
		translate([7,2,-37.5]) cylinder(r=38/2,h=55);

		// mount for DC gearbox motor PGM-37DC12/77 			
		
		translate([0,2,0]) cylinder(r=12.5/2,h=150);
		// motor shaft is 7mm above center; lowering the mounting bolts
		translate(v=[7,2,15]){
			for(i=[0:5]){						
				rotate(a=60*i, v=[0,0,1]) translate([0,31/2,0]) cylinder(r=2,h=15);	
			}
		} 

	}
}

module hopper(){
	
	
}
module case(){
	translate(v=[0,0,23]){
		union(){
			difference(){
				difference(){			
					union(){
						//cylinder(r=26, h=9);
						
						translate(v=[-5,35+20,5+(total_height+6)/2]) cube(size=[42+30,20+40,10+total_height+6], center=true);
					}
					// cut the shape of the disk with a little margin
					translate(v=[0,0,11]) cylinder(r=(outer_diameter+1.5)/2, h=total_height+2);
					// main feed hole
					translate(v=[-50,50,11+(total_height+1)/2])  cube(size=[70,60,total_height-3], center=true);
					//translate(v=[-10,28,11+(total_height+1)/2]) rotate(a=-60,v=[0,0,1]) cube(size=[70,40,total_height-3], center=true);
					translate(v=[-15,28,11+(total_height+1)/2]) rotate(a=25,v=[0,0,1]) translate(v=[-15,10,0]) cube(size=[70,140,total_height-3], center=true);
				
					translate(v=[-50,95,0+(total_height+1)/2-1]) rotate(a=-15,v=[0,10,0]) cube(size=[70,120,8], center=true);
				}				


			}


			
			translate(v=[-41,80,0]) cube(size=[70,5,16+total_height]);
			rotate(a=-90,v=[0,1,0]) translate(v=[0,86.5,-31]) mounted_nut(72);
			rotate(a=-90,v=[0,1,0]) rotate(a=90,v=[0,0,1]) translate(v=[25,1.5,-31]) mounted_nut(72);
			rotate(a=-90,v=[0,1,0]) rotate(a=-90,v=[0,0,1]) translate(v=[-25-18,1.5+16+total_height,-31]) mounted_nut(72);

		}
	}
}


module wheel(){

	difference(){
	
		cylinder(r=outer_diameter/2, h=total_height);
	
		// motor stuff
		difference(){	
			cylinder(r=3.15, h=total_height);
			translate(v=[-5,2.2,0]) cube(size=[10,10,total_height]);	
		}
		for (i = [0:7]) {
			rotate(a=45*i, v=[0,0,1]) translate(v=[29,-2.5,1]) cylinder(r=hole_dia/2, h=total_height-2);
			// holes to reach the motor bolts
	//		rotate(a=45+90*i, v=[0,0,1]) translate(v=[22,-2.5,0]) cylinder(r=4, h=total_height);
			
		}	

	}
	
}


