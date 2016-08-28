// Countdown.sqf

lcdleft = _this select 0;
player_loadoutcooldown = false;

while {true} do {
//hintsilent format ["Loadout Cooldown: %1", [((lcdleft)/60)+.01,"HH:MM"] call bis_fnc_timetostring];
player_loadoutcooldown = true;
if (lcdleft < 1) exitWith{};
lcdleft = lcdleft -5;
sleep 5;
};
player_loadoutcooldown = false;