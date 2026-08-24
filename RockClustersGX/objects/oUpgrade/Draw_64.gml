draw_set_font(fScore);
draw_text(16,745,string_join("","Wallet: ","$",global.allmoney));
draw_set_font(fTitle);
draw_text(32,32,"UPGRADES (Beta)");
draw_set_font(fTitle);
draw_text(120,120 + (option * 100),">");
if (option != 0) draw_set_colour(c_gray);
if (global.ug_jump) > 0
draw_text(150,120,string_join(" ","Jump Height:", "<", global.ug_jump, ">"));
if (global.ug_jump) < 1
draw_text(150,120,string_join(" ","Jump Height:", " ", global.ug_jump, ">"));
if (global.ug_jump) > 0 && (global.allmoney < 15)
draw_text(150,120,string_join(" ","Jump Height:", "<", global.ug_jump, " "));
draw_set_colour(c_white);
if (option != 1) draw_set_colour(c_gray);
if (global.ug_speed) > 0
draw_text(150,220,string_join(" ","Speed:", "<", global.ug_speed, ">"));
if (global.ug_speed) < 1
draw_text(150,220,string_join(" ","Speed:", " ", global.ug_speed, ">"));
if (global.ug_speed) > 0 && (global.allmoney < 5)
draw_text(150,220,string_join(" ","Speed:", "<", global.ug_speed, " "));
draw_set_colour(c_white);