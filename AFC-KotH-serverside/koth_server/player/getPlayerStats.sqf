/*
	File: fn_getPlayerStats.sqf
	Author: Itsatrap
	Description:
		NONE
	Parameters:
		NONE
*/

private ["_player", "_clientID", "_playerUID", "_playerName"];

_paramArray = _this select 1;
_player 	= _paramArray select 0;

if(_player isEqualTo objNull ) exitWith { false };
_playerUID	= getPlayerUID _player;
if(_playerUID isEqualTo "" ) exitWith { false };

_clientID 	= owner _player;
_playerName = [(name _player)] call KOTH_fnc_strip;
_data 		= [0,0,0,0,0];



_isKnownAccount = format["existPlayerData:%1", _playerUID] call KOTH_fnc_single;
if (!(_isKnownAccount select 0)) then
{
	diag_log format ["KOTH: Client: %1(%2) connected for the first time. Creating profile...",_playerName, _playerUID];
	format["insertPlayerStats:%1:%2", _playerUID, _playerName] call KOTH_fnc_fireandforget;
}
else
{
	//***************************
	// USE THIS FOR A MONTH OR TWO THEN COMMENT OUT
	format["UpdatePlayerGuid:%1", _playerUID] call KOTH_fnc_fireandforget;
	//***************************

	_data = format["selectPlayerStats:%1", _playerUID] call KOTH_fnc_single;
};

_xp 		= _data select 0;
_kills 		= _data select 1;
_deaths 	= _data select 2;
_admin	 	= _data select 3;
_donator 	= _data select 4;

diag_log format ["KOTH: Client: Name: %1(%3) connected (XP: %2)", _playerName, _xp, _playerUID];
player_stats_load = [_xp,_kills,_deaths,_admin,_donator];
owner _player publicVariableClient "player_stats_load";
