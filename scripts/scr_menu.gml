switch (curr_pos)
{
    case 0:
    {
        if (ds_map_find_value(global.options, "save_code") == "0S")
        {
            room_goto(ragnarok_intro);
        }
        
        if (ds_map_find_value(global.options, "save_code") == "1S0")
        {
            global.tutorial[0] = 0; global.tutorial[1] = 0;
            global.tutorial[2] = 0; global.tutorial[3] = 0;
            item_set_value("Halsvord", 40); room_goto(dark_forest_1);
        }
        
        if (ds_map_find_value(global.options, "save_code") == "1S1")
        {
            global.tutorial[0] = 0; global.tutorial[1] = 0;
            global.tutorial[2] = 0; global.tutorial[3] = 0;
            item_set_value("Halsvord", 240); room_goto(dark_forest_1);
        }
        break;
    }
        
    case 1:
    {
        room_goto(ragnarok_intro);
        break;
    }
    
    case 2:
    {
        instance_create(0, 0, obj_option_menu);
        break;
    }
    
    case 3:
    {
        game_end();
        break;    
    }
    
    default: break;
}
