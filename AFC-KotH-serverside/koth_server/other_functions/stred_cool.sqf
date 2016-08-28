// Countdown.sqf

time_red = _this select 0;

while {time_red > 0} do {
//hintsilent format ["Spawntruck Cooldown: %1", [((time_red)/60)+.01,"HH:MM"] call bis_fnc_timetostring];
if (time_red < 1) exitWith{};
time_red = time_red -5;
publicVariable "time_red";
sleep 5;
};