///quest_complete(number_of_quest)

for (i = 0; i < 5; i++)
{
    if (quest_ucheck(argument0))
    {
        global.complete[i] = global.uncomplete[i];
        global.uncomplete[i] = "";
        if (!instance_exists(obj_new_quest)) instance_create(0, 0, obj_new_quest);
        break;
    }
}
