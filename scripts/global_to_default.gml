///global_to_default()

global.planescape_file = "";
global.final_kind = 0;
global.planescape_parent = 0;
global.full_show = false;
global.kill_the_arab = false;
global.previous_room = "main_menu";
global.garage_scene = 0;
global.unchained_1 = false;
global.aggressive = false;
global.unspidered_1 = false;

global.pause = paused.non_pause; //Pause events

for (i = 0; i < 6; i++) //Generate arrays for Quests
{
    global.complete[i] = "";
    global.uncomplete[i] = "";
}

for (j = 0; j < 4; j++) global.tutorial[i] = 0; //Generate array for Tutorials

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

for (n = 0; n < 10; n++) global.inventory[n] = ""; //Inventory is Viggo Valentine

global.inventory[0] = "Halsvord";
global.inventory[1] = "Medical_Rune";
