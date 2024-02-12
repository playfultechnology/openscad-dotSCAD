use <stereographic_extrude.scad>

txt = "1234";
square_size = 40;
font_name = "Arial";
font_size = 64;
fn = 24;
shadow = "YES"; // [YES, NO]
base_height = 2;

// Create a 2D image of four characters placed in corners of a square
module four_chars(txt, square_size, font_name, font_size) {
    frame_width = 0.225 * square_size;

    for(i = [0:3]) {
        offset_x = square_size * 0.8 * (i == 1 || i == 2 ? 1 : -1) + 
                   frame_width / 2 * (i == 0 || i == 3 ? 1 : -1);
        offset_y = square_size * 0.8 * (i == 0 || i == 1 ? 1 : -1) +
                   frame_width / 2 * (i == 0 || i == 1 ? -1 : 1);
        
        translate([offset_x, offset_y, 0]) 
        intersection() {
            union() {
                rotate(-135 - 90 * i) scale([1.15, 1, 1]) 
                    text(txt[i], size = font_size, font = font_name, valign = "center", halign = "center");   
                
                difference() {
                    square(square_size * 1.6, center = true);
                    square(square_size * 1.15, center = true);
                }
            }
            square(square_size * 1.6, center = true);
        }
    }
}

// Calculate 3D image required to create desired projection 
stereographic_extrude(square_size * 2.975, convexity = 10) 
    four_chars(txt, square_size, font_name, font_size);

if($preview && shadow == "YES") {
    color("red") 
    linear_extrude(base_height) 
        four_chars(txt, square_size, font_name, font_size);
}