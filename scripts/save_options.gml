///save_options()

var file; file = file_text_open_write("Options.franbow");
file_text_write_string(file, "fullscreen = " + string(ds_map_find_value(global.options, "fullscreen")));
file_text_writeln(file);
file_text_write_string(file, "volume = " + string(ds_map_find_value(global.options, "volume")));
file_text_writeln(file);
file_text_write_string(file, "history_mode = " + string(ds_map_find_value(global.options, "history_mode")));
file_text_writeln(file);
file_text_write_string(file, "save_code = " + string(ds_map_find_value(global.options, "save_code")));
file_text_writeln(file);
file_text_write_string(file, "survival_mode = " + string(ds_map_find_value(global.options, "survival_mode")));
file_text_writeln(file);
file_text_writeln(file);
file_text_write_string(file, "Please, don't change this file by hands! Thx :)");
file_text_close(file);
