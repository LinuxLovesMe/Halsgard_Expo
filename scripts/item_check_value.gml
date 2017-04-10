///item_check_value(item_name)

for (r = 0; r < 9; r++)
{
    if (global.inventory[r] == argument0)
    {
        return ds_list_find_value(ds_map_find_value(global.items_list, global.inventory[r]), 1);
        break;
    }
}
