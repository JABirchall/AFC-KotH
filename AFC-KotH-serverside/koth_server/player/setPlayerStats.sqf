/*
	File: .sqf
	Author: itsatrap
	Description:
		NONE
	Parameters:
		NONE
*/

private ["_stats","_playerUID", "_name","_player"];
_obj 		= _this select 1;
_player 	= [_obj, 0, objNull, [objNull]] call BIS_fnc_param;
_stats 		= [_obj, 1, [0,0,0], [[]]] call BIS_fnc_param; // [XP,KILLS,DEATH]

_playerName = [(name _player)] call KOTH_fnc_strip;
_playerUID 	= getPlayerUID _player;

if (KOTH_DEBUG) then
{
	diag_log format["KOTH: UpdatePlayerStats:%1, %2, [%3,%4,%5]",_playerUID, _playerName, (_stats select 0), (_stats select 1), (_stats select 2)];
};

format["UpdatePlayerStats:%1:%2:%3:%4:%5",_playerUID, _playerName, (_stats select 0), (_stats select 1), (_stats select 2)] call KOTH_fnc_fireandforget;
