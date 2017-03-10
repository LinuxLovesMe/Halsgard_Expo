var chunk = choose(12, 18, 24);

for (i = 0; i < sprite_width; i += chunk)
{
    for (j = 0; j < sprite_height; j += chunk)
    {
        particle = instance_create(irandom_range(x - i, x + i), irandom_range(y - j, y), choose(obj_dest_01, obj_dest_02, obj_dest_03, obj_dest_04, obj_dest_05));        
    }
}
