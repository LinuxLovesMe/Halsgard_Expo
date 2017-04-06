switch (curr_pos)
{
    case 0: //Continue
    {
        if (ds_map_find_value(global.options, "save_code") == "0level")
        {
            room_goto(ragnarok_intro);
        }
        
        if (ds_map_find_value(global.options, "save_code") == "1level")
        {
            if (global_to_default() == "done")
            {
                states_load(0); room_goto(dark_forest_1);
            }
        }
        break;
    }
        
    case 1: //New Game
    {
        ds_map_replace(global.options, "save_code", "0level"); //Re-write savegames if player has started new game
        save_options();
        if (global_to_default() == "done") room_goto(ragnarok_intro);
        break;
    }
    
    case 2: //Options
    {
        instance_create(0, 0, obj_option_menu);
        break;
    }
    
    case 3: //Quit to Desktop
    {
        game_end(); break;
    }
}
