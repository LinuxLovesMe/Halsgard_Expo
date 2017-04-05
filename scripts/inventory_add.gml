///inventory_add(item_name)

for (i = 2; i < 9; i++)
{
    if (global.inventory[i] == "")
    {
        global.inventory[i] = argument0;
        break;
    }
}
