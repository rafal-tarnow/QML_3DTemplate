$fn = 100;
profile_width = 80;
profile_heigth = 80;
profile_length = 210;
profile_drill_diameter = 10;

/*translate([0,0,10])
    cube([profile_width,profile_length,profile_heigth], center = false);
 */
 
 difference_offset = 1;
 




 
 
 difference(){

roundedCubeProfile(profile_length,profile_width,80,4);
cylinder_cut(20,20,10,profile_length);
     cylinder_cut(20,-20,10,profile_length);
     cylinder_cut(-20,20,10,profile_length);
     cylinder_cut(-20,-20,10,profile_length);

    
     //top
     t_cut(-20,40,0, profile_length);
     t_cut(20,40,0, profile_length);
    //right 
     t_cut(40,20,90, profile_length);
     t_cut(40,-20,90, profile_length);
     //bottom
     t_cut(20,-40,180, profile_length);
     t_cut(-20,-40,180, profile_length);
     //left
     t_cut(-40,20,270, profile_length);
     t_cut(-40,-20,270, profile_length);
     
     t_cut(0,20,-90, profile_length);
     t_cut(0,20,90, profile_length);
     t_cut(20,0,180, profile_length);
     t_cut(20,0,0, profile_length);
     
     t_cut(-20,0,180, profile_length);
     t_cut(-20,0,0, profile_length);
     
     t_cut(0,-20,90, profile_length);
     t_cut(0,-20,-90, profile_length);
 }

module cylinder_cut(x_pos = 0, z_pos = 0, diameter = 1,length = 100){
    translate([x_pos, 0, z_pos])
    rotate([-90,0,0])
   cylinder(h=length,r=diameter/2);
}

module t_cut(x_pos = 0, z_pos = 0, rotation = 0, length = 100){
    translate([x_pos, length, z_pos])
    rotate([90,rotation,0]) linear_extrude(length) #polygon(points=[[-6,0],[-6,-2],[-5,-2],[-5,-6],[-10,-6],[-10,-8.543],[-6.043,-12.5],[6.043,-12.5],[10,-8.543],[10,-6],[5,-6],[5,-2],[6,-2],[6,0]]);
    
}

module roundedCubeProfile(profile_length = 100, profile_width = 80, profile_height = 80, corner_radius = 4, ){

translate([-profile_width/2, 0,-profile_heigth/2])
    hull(){

    translate([profile_width- corner_radius,0,corner_radius])
    rotate([-90,0,0])
    cylinder(profile_length,corner_radius, corner_radius, center=false);
    
    translate([corner_radius,0,corner_radius])
    rotate([-90,0,0])
    cylinder(profile_length,corner_radius, corner_radius, center=false);
    
        translate([profile_width - corner_radius,0,profile_height-corner_radius])
    rotate([-90,0,0])
    cylinder(profile_length,corner_radius, corner_radius, center=false);
    
            translate([corner_radius,0,profile_height-corner_radius])
    rotate([-90,0,0])
    cylinder(profile_length,corner_radius, corner_radius, center=false);
    };
    
    

} 