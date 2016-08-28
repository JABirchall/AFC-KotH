// Countdown.sqf

time_ind = _this select 0;

while {time_ind > 0} do {
//hintsilent format ["Spawntruck Cooldown: %1", [((time_ind)/60)+.01,"HH:MM"] call bis_fnc_timetostring];
if (time_ind < 1) exitWith{};
time_ind = time_ind -5;
publicVariable "time_ind";
sleep 5;
};