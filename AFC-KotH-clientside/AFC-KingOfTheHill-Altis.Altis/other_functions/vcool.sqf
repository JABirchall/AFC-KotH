// Countdown.sqf

vcdleft = _this select 0;
player_vcooldown = false;

while {true} do {
//hintsilent format ["Vehicle Cooldown: %1", [((vcdleft)/60)+.01,"HH:MM"] call bis_fnc_timetostring];
player_vcooldown = true;
if (vcdleft < 1) exitWith{};
vcdleft = vcdleft -5;
sleep 5;
};
player_vcooldown = false;