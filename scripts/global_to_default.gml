///global_to_default()

global.planescape_file = "";
global.final_kind = 0;
global.planescape_parent = 0;
global.full_show = false;
global.kill_the_arab = 0;
global.previous_room = "main_menu";
global.garage_scene = false;
global.aggressive = false;
global.unchained_1 = false;
global.unspidered_1 = false;
global.pince_find = false;
global.garage_secret = false;

global.pause = paused.non_pause; //Pause events

global.noise_effect = 0;
global.Color2 = make_colour_rgb(150, 210, 242); //Colour for active answer
global.myColor = make_colour_rgb(120, 168, 194); //Colour for inactive answer

quest_clear(); //Generate arrays for Quests

for (j = 0; j < 4; j++) global.tutorial[j] = 0; //Generate array for Tutorials

//Aid's skills and stats arrays init

global.character[0] = 0; //Физическое здоровье
global.character[1] = 0; //Сила Вигго
global.character[2] = 0; //Целительная энергия
global.character[3] = 0; //Зов Хильд
global.character[4] = 0; //Начитанность (мудрость)
global.character[5] = 0; //Дар Браги
global.character[6] = 0; //Предсказание Скульд
global.character[7] = 0; //Физическая активность
global.character[8] = 0; //Current HP status
global.character[9] = 0; //Current AP status

for (n = 0; n < 9; n++) global.inventory[n] = ""; //Inventory is Viggo Valentine

global.inventory[0] = "Halsvord";
global.inventory[1] = "Medical_Rune";

return "done";
