switch (curr_pos)
{
    case 0:
    {
        room_goto(dark_forest_1);
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
