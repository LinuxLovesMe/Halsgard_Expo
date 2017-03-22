///item_set_value(item_name, new_value)

for (i = 0; i < 9; i++)
{
    if (global.inventory[i] == argument0)
    {
        ds_list_replace(ds_map_find_value(global.items_list, global.inventory[i]), 1, argument1);
        break;
    }
}
