/*
	File: .sqf
	Author: itsatrap
	Description:
		NONE
	Parameters:
		NONE
*/
private ["_gear","_playerUID", "_loadoutid","_player"];
_playerUID 	= [_this, 0, 0, [""]] call BIS_fnc_param;
_loadoutid 	= [_this, 1, 1] call BIS_fnc_param;
_gear 		= [_this, 2, ""] call BIS_fnc_param;

if (KOTH_DEBUG) then
{
	diag_log format["KOTH: setloadgear:%1,%2,%3",_playerUID, _loadoutid, _gear];
};
_result = (format["existPlayerGear:%1:%2", _playerUID, _loadoutid] call KOTH_fnc_single) select 0;

if (!_result) then
{
	if (KOTH_DEBUG) then
	{
		diag_log format["KOTH: insertPlayerGear:%1, %2",_playerUID, _loadoutid];
	};
	format["insertPlayerGear:%1:%2:%3", _playerUID, _loadoutid, _gear] call KOTH_fnc_fireandforget;
}
else
{
	if (KOTH_DEBUG) then
	{
		diag_log format["KOTH: updatePlayerGear:%1, %2",_playerUID,_loadoutid];
	};
	format["updatePlayerGear:%1:%2:%3", _playerUID,_loadoutid,_gear] call KOTH_fnc_fireandforget;
};
