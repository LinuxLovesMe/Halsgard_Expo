switch (curr_pos)
{
    case 0: //Continue
    {
        if (ds_map_find_value(global.options, "save_code") == "0S")
        {
            room_goto(ragnarok_intro);
        }
        
        if (ds_map_find_value(global.options, "save_code") == "1S0")
        {
            global_to_default();
            item_set_value("Halsvord", 40); room_goto(dark_forest_1);
        }
        
        if (ds_map_find_value(global.options, "save_code") == "1S1")
        {
            global_to_default();
            item_set_value("Halsvord", 240); room_goto(dark_forest_1);
        }
        
        break;
    }
        
    case 1: //New Game
    {
        ds_map_replace(global.options, "save_code", "0S"); //Re-write savegames if player has started new game
        save_options();
        global_to_default();
        room_goto(ragnarok_intro);
        break;
    }
    
    case 2: //Options
    {
        instance_create(0, 0, obj_option_menu);
        break;
    }
    
    case 3: //Quit to Desktop
    {
        game_end();
        break;
    }
}
