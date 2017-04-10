///states_load(filename)

file = file_text_open_read("States_" + string(argument0) + ".franbow");

if (!file_text_eof(file))
{
    var next_string = file_text_read_string(file);
    
    for (i = 0; i < 2; i++) //Basic inventory items count = 2
    {
        if (i == 0) item_set_value("Halsvord", real(string_copy(next_string, 1, string_pos("_", next_string))));
        if (i == 1) item_set_value("Medical_Rune", real(string_copy(next_string, 1, string_pos("_", next_string))));
        
        next_string = string_copy(next_string, string_pos("_", next_string) + 1, string_length(next_string));
    }
    
    file_text_readln(file);
    next_string = file_text_read_string(file); //Reading artifacts from file
    
    while (!string_pos("AP", next_string))
    {
        inventory_add(next_string);
        file_text_readln(file);
        next_string = file_text_read_string(file);
    }
    
    global.character[9] = real(string_digits(next_string)); //Set current value of hero's AP
    
    file_text_readln(file);
    next_string = file_text_read_string(file);
    
    while (string_pos("QS", next_string) or string_pos("QC", next_string))
    {
        quest_add(real(string_digits(next_string)));
        if (string_pos("QC", next_string)) quest_complete(real(string_digits(next_string)));
        
        if (!file_text_eof(file)) file_text_readln(file); else break;
        if (!file_text_eof(file)) next_string = file_text_read_string(file); else break;
    }
    
    //Read hero choices needs for scenario missions!
    
    file_text_close(file);
}
