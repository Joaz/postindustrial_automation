// note: use Aluminium T-slot


include<../../libs/tslot.scad>


module wood_cut1(z=12){
    cube([450,100,z]);
}

module wood_cut2(z=12){
    cube([450+z*2,100,z]);
}
module wood_cut3(z=12){
    cube([225,225,z]);
}

module frame(h=160){
    
    translate([0,0,20]) rotate([0,90,0 ]) tslot20(600);
    translate([0,520,20]) rotate([0,90,0 ]) tslot20(600);
    translate([0,520,0]) rotate([90,0,0 ]) tslot20(500);
    translate([580,520,0]) rotate([90,0,0 ]) tslot20(500);

    translate([0,0,20+h+20]) rotate([0,90,0 ]) tslot20(600);
    translate([0,520,20+h+20]) rotate([0,90,0 ]) tslot20(600);
    translate([0,520,0+h+20]) rotate([90,0,0 ]) tslot20(500);
    translate([580,520,0+h+20]) rotate([90,0,0 ]) tslot20(500);
        
    translate([0,0,20]) tslot20(h);
    translate([580,0,20]) tslot20(h);
    translate([0,520,20]) tslot20(h);
    translate([580,520,20]) tslot20(h);
    translate([290,0,20]) tslot20(h);
    translate([290,520,20]) tslot20(h);

    translate([0,210,20]) tslot20(h);
    translate([580,210,20]) tslot20(h);
    
     
    translate([0,50,40]) rotate([0,90,0 ]) tslot20(600);
    translate([0,180,40]) rotate([0,90,0 ]) tslot20(600);
    
 

}
module magazine(x,y,z){
  translate([0,0,20]) rotate([0,0,0 ]) tslot20(z);
  translate([0,y+20,20]) rotate([0,0,0 ]) tslot20(z);
  translate([-x+20,0,20]) rotate([0,0,0 ]) tslot20(z);
  translate([-x+20,y+20,20]) rotate([0,0,0 ]) tslot20(z);
  
  translate([-x+20,0,20]) rotate([0,90,0 ]) tslot20(x);
  translate([-x+20,y+20,20]) rotate([0,90,0 ]) tslot20(x);
  translate([0,20+y,0]) rotate([90,0,0 ]) tslot20(y);
  translate([-x+20,20+y,0]) rotate([90,0,0 ]) tslot20(y);

  translate([-x+20,0,20+z]) rotate([0,90,0 ]) tslot20(x);
  translate([-x+20,y+20,20+z]) rotate([0,90,0 ]) tslot20(x);
  translate([0,20+y,z]) rotate([90,0,0 ]) tslot20(y);
  translate([-x+20,20+y,z]) rotate([90,0,0 ]) tslot20(y);

} 

frame();
translate([-20,50,0]) magazine(500,120,900);


for(i=[0:70]){
   translate([-490,75,30+12.5*i]) wood_cut2();
}

translate([50,75,30]) wood_cut2();
translate([50,230,30]) wood_cut3();


