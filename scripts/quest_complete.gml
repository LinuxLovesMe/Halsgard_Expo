///quest_complete(number_of_quest)

for (i = 0; i < 5; i++)
{
    if (quest_ucheck(argument0))
    {
        global.complete[i] = global.uncomplete[i];
        global.uncomplete[i] = ""; break;
    }
}
