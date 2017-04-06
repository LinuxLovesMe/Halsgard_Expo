///scr_desc_width(description_string)

var iteration = 1;
var result = 0;
var old_word = "";
var spacePos = 0;
var new_word = "";
var string_full = argument0;

var minimum = 500;
var coef = floor(string_width(argument0) / 500);

repeat (coef)
{
    new_word = ""; old_word = "";    
    while (string_width(new_word) < 500)
    {
        spacePos = string_pos(" ", string_full);
        var subString = string_copy(string_full, 1, spacePos);
        old_word = new_word;
        new_word = string_insert(subString, new_word, string_length(new_word) + 1);
        string_full = string_copy(string_full, spacePos + 1, string_length(string_full));
    }
    
    result[iteration] = 500 - string_width(old_word);
    iteration++;
    string_full = string_copy(string_full, string_pos(old_word, string_full) + 1, string_length(string_full));
}

result[iteration] = 500 - string_width(string_full);

for (j = 0; j < iteration; j++) minimum = min(minimum, result[ j + 1 ]);

width = (500 - minimum) / 320 + 0.074; return width;
