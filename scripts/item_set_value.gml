///item_set_value(item_name, new_value)

for (d = 0; d < 9; d++)
{
    if (global.inventory[d] == argument0)
    {
        ds_list_replace(ds_map_find_value(global.items_list, global.inventory[d]), 1, argument1);
        break;
    }
}
