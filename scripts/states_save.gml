///states_save(filename)

file = file_text_open_write("States_" + string(argument0) + ".franbow");

next_string = string(item_check_value("Halsvord")) + "_" + string(item_check_value("Medical_Rune")) + "_";

file_text_write_string(file, next_string); file_text_writeln(file);

for (i = 2; i < 9; i++) //Cells for artifacts nowadays = 2 to 8
{
    if (global.inventory[i] != "")
    {
        file_text_write_string(file, global.inventory[i]); file_text_writeln(file);
    }
}

next_string = "AP" + string(global.character[9]); //Write current value of hero's AP

file_text_write_string(file, next_string); file_text_writeln(file);

for (q = 0; q < 7; q++) //Count of different in-game quests = 7
{
    if (quest_ucheck(q))
    {
        file_text_write_string(file, "QS" + string(q)); file_text_writeln(file);
    }
    if (quest_ccheck(q))
    {
        file_text_write_string(file, "QC" + string(q)); file_text_writeln(file);
    }
}

//Write hero choices needs for scenario missions!

file_text_close(file);
