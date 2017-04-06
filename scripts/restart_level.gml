///restart_level()

if (ds_map_find_value(global.options, "save_code") == "1level")
{
    if (room_get_name(room) == "dark_forest_3")
    {
        global.aggressive = false;
        global.garage_scene = 0;
        global.kill_the_arab = 0;
        global.unspidered_1 = false;
        states_load(1); room_restart();
    }
    else
    {
        if (global_to_default() == "done")
        {
            global.previous_room = "main_menu";
            states_load(0);
            room_goto(dark_forest_1);
        }
    }
}
