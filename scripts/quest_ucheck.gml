///quest_ucheck(number_of_quest)

var checked = false;

for (i = 0; i < 5; i++)
{
    if (global.uncomplete[i] == global.quest[argument0])
    {
        checked = true;
        break;
    }
}

return checked;
