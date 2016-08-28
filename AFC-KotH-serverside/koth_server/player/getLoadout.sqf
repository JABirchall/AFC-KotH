/*
	File: .sqf
	Author: Itsatrap
	Description:
		NONE
	Parameters:
		NONE
*/
private ["_player", "_clientID", "_playerUID", "_loadoutid","_defaultGear"];
_player 		= [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_loadoutid 		= [_this, 1, 1, [0]] call BIS_fnc_param;
_playerUID 		= getPlayerUID _player;
_defaultGear 	= ["","","","","","","","",["","","",""],["","","",""],["","","",""],["ItemMap"],[[],[]],[["FirstAidKit"],[1]],[],[[],[]],[[],[]],[],[[],[]],[[],[]],[[],[]],[]];

if (KOTH_DEBUG) then
{
	diag_log format["KOTH: getloadgear:%1, %2",_playerUID, _loadoutid];
};
_result = (format["existPlayerGear:%1:%2", _playerUID, _loadoutid] call KOTH_fnc_single) select 0;

if (!_result) then {
	format["insertPlayerGear:%1:%2:%3", _playerUID, _loadoutid, 0] call KOTH_fnc_fireandforget;
};

if (KOTH_DEBUG) then
{
	diag_log format["KOTH: selectPlayerGear:%1, %2",_playerUID, _loadoutid];
};

_data = format["selectPlayerGear:%1:%2", _playerUID,_loadoutid] call KOTH_fnc_single;
player_getGear = _data;
owner _player publicVariableClient "player_getGear";
