global.view_width = global.game_settings.resolution_width / global.game_settings.resolution_scale;
global.view_height = global.game_settings.resolution_height / global.game_settings.resolution_scale;
view_target = obj_player;
view_spd = 0.1;
window_set_size(global.view_width * global.game_settings.resolution_scale,global.view_height * global.game_settings.resolution_scale);
surface_resize(application_surface,global.view_width * global.game_settings.resolution_scale,global.view_height * global.game_settings.resolution_scale);
display_set_gui_size(global.view_width,global.view_height);
window_center()