// Countdown.sqf

scdleft = _this select 0;
player_savecooldown = false;

while {true} do {
//hintsilent format ["Player Save Cooldown: %1", [((scdleft)/60)+.01,"HH:MM"] call bis_fnc_timetostring];
player_savecooldown = true;
if (scdleft < 1) exitWith{};
scdleft = scdleft -5;
sleep 5;
};
player_savecooldown = false;