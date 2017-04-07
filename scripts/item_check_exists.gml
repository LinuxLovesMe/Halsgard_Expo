///item_check_exists(item_name)

var exists = false;

for (i = 2; i < 9; i++)
{
    if (global.inventory[i] == argument0)
    {
        exists = true; break;
    }
}
return exists;
