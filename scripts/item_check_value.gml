///item_check_value(item_name)

for (i = 0; i < 9; i++)
{
    if (global.inventory[i] == argument0)
    {
        return ds_list_find_value(ds_map_find_value(global.items_list, global.inventory[i]), 1);
        break;
    }
}
