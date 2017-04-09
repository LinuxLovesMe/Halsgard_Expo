///quest_add(number_of_quest)

var done = false;

for (i = 0; i < 5; i++)
{
    if ((global.uncomplete[i] == "") and (global.complete[i] == ""))
    {
        done = true;
        global.uncomplete[i] = global.quest[argument0];
        break;
    }
}

if (done == false)
{
    quest_clear();
    global.uncomplete[0] = global.quest[argument0];
}

if (!instance_exists(obj_new_quest)) instance_create(0, 0, obj_new_quest);
