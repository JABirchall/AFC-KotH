// File: Autoteambalance.sqf
// Author: BrezZZz
// Date: 29.03.16

waitUntil {!isNil "player_info"};
_admin = player_info select 0;
if (_admin > 0) exitwith {};

private ["_blucount","_redcount","_greencount"];

tb_maxDif = 4;
tb_blucount = (playersNumber west);
tb_redcount = (playersNumber east);
tb_indcount = (playersNumber independent);


if (side player == west) then {
	if ((tb_blucount >= (tb_redcount + tb_maxDif)) || (tb_blucount >= (tb_indcount + tb_maxDif))) then {
		player enableSimulation false;
		titleText ["Teams are unbalanced, Please change Team!!!", "BLACK FADED", 999];
		uisleep 8;
		["unBalancedTeams",false,2] spawn BIS_fnc_endMission;
	};
};
if (side player == east) then {
	if ((tb_redcount >= (tb_blucount + tb_maxDif)) || (tb_redcount >= (tb_indcount + tb_maxDif))) then {
		player enableSimulation false;
		titleText ["Teams are unbalanced, Please change Team!!!", "BLACK FADED", 999];
		uisleep 8;
		["unBalancedTeams",false,2] spawn BIS_fnc_endMission;
	};
};
if (side player == independent) then {
	if ((tb_indcount >= (tb_blucount + tb_maxDif)) || (tb_indcount >= (tb_redcount + tb_maxDif))) then {
		player enableSimulation false;
		titleText ["Teams are unbalanced, Please change Team!!!", "BLACK FADED", 999];
		uisleep 8;
		["unBalancedTeams",false,2] spawn BIS_fnc_endMission;
	};
};	





