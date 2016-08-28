// Countdown.sqf

time_blue = _this select 0;

while {time_blue > 0} do {
//hintsilent format ["Spawntruck Cooldown: %1", [((time_blue)/60)+.01,"HH:MM"] call bis_fnc_timetostring];
if (time_blue < 1) exitWith{};
time_blue = time_blue -5;
publicVariable "time_blue";
sleep 5;
};