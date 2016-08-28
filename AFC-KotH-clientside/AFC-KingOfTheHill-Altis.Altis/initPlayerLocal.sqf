/*
	File: initPlayerLocal.sqf
	Author: itsatrap
	
	Description:
		Executed locally when player joins mission (includes both mission start and JIP).
	Parameters:
		NONE
*/
if( !hasInterface ) exitWith {}; 
waitUntil { !isNull player }; 
waitUntil { local player };
player setVariable["hideticker",false];

caseAFK = 0;
actPos = "0";
actPos2 = "0";
actCount = 0;
StringActPos = "0";
StringActPos2 = "0";

["InitializePlayer", [player]] call BIS_fnc_dynamicGroups; // Initializes the player/client side Dynamic Groups framework

waitUntil {alive player};
onKeyPress = compile preprocessFile "other_functions\onKeyPress.sqf";
waituntil {!(IsNull (findDisplay 46))};
(findDisplay 46) displaySetEventHandler ["KeyDown", "_this call onKeyPress;"];

waitUntil {!((getMarkerPos "objective_main") isEqualTo [0,0,0])};
task1 = player createSimpleTask ["Secure the Objective"];
task1 setSimpleTaskDescription ["Secure the Objective, first team that gets 200 tickets win","Secure the Objective","Objective"];
task1 setSimpleTaskDestination (getMarkerPos "objective_main");
task1 setTaskState "Assigned";
player setCurrentTask task1;

waitUntil {!isNil "locationmarkers"};
_plrClass = typeOf player;
_side = getNumber(configFile >> "cfgVehicles" >> _plrClass>> "side");
_spawn = [0,0,0];
switch (_side) do
{
	case 0: {_spawn = getMarkerPos "respawn_east";}; 
	case 1: {_spawn = getMarkerPos "respawn_west";}; 
	case 2: {_spawn = getMarkerPos "respawn_guerrila";}; 	
};
player setpos _spawn;

showScoretable 0;

// Donator Welcome 
[] execVM "other_functions\donatorWelcome.sqf";

// AutoTeambalance
[] execVM "other_functions\Autoteambalance.sqf";