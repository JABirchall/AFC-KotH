private ["_side", "_killer", "_killerSide", "_unit", "_veh", "_del"];

_side 		= [_this, 0, "null", [""]] call BIS_fnc_param;
_killer 	= [_this, 1, objNull, [objNull]] call BIS_fnc_param;

if(count _this > 1) then 
{
	_killerSide = side _killer;
} else {
	_killerSide = sideUnknown;
};

//diag_log format["CSG: spawntruck killer %1 side %2",name _killer, _killerSide];

// ********************************************************************
// ********************************************************************
if(_side == "bluf") then
{
	spawntruck_blu = "B_Truck_01_covered_F" createVehicle (getMarkerPos "respawn_vehicle_west");
	spawntruck_blu setDir (markerDir "respawn_vehicle_west"); 
	spawntruck_blu setObjectTextureGlobal [0,'textures\spawntruck_blue_1.jpg'];
	spawntruck_blu setObjectTextureGlobal [1,'textures\spawntruck_blue_2.jpg'];
	spawntruck_blu enableRopeAttach false;
	spawntruck_blu addMPEventHandler ["mpkilled",{["blu",_this select 1] spawn respawnTruck}];
	spawntruck_blu addEventHandler ["GetIn", {   _unit = _this select 2;   if (side _unit != west) then {    _veh = _this select 0;    _unit action ["eject", _veh];   };  }];
	spawntruck_blu addEventHandler ["GetOut", {_this call CSG_water}];
	//[west, spawntruck_blu] call BIS_fnc_addRespawnPosition;
	spawntruck_blu setVariable["persistent",true];
	spawntruck_blu setVariable["spawntruck_blu",true];
	spawntruck_blu addItemCargoGlobal ["ToolKit", 1];
	publicVariable "spawntruck_blu";
};
if(_side == "blu") then
{
	[360] execVM "koth_server\other_functions\stblu_cool.sqf";
	_del = spawntruck_blu;
	//[west, spawntruck_blu] call BIS_fnc_removeRespawnPosition;
	//Kill
	if (_killerSide != west && isPlayer _killer) then
	{ 
		player_stats_add = [250,0,0];
		diag_log format["CSG: %1(%2) XP(%3) destroyed Blue team spawn truck!",name _killer, faction _killer, player_stats_add];
		owner _killer publicVariableClient "player_stats_add";
	};
	
	spawntruck_blu = 0;
	publicVariable "spawntruck_blu";

	uisleep 60;
	deleteVehicle _del;

	uisleep 300;
	"bluf" spawn respawnTruck;
};
// ********************************************************************
// ********************************************************************
if(_side == "redf") then
{
	spawntruck_red = "B_Truck_01_covered_F" createVehicle (getMarkerPos "respawn_vehicle_east");
	spawntruck_red setDir (markerDir "respawn_vehicle_east"); 
	spawntruck_red setObjectTextureGlobal [0,'textures\spawntruck_red_1.jpg'];
	spawntruck_red setObjectTextureGlobal [1,'textures\spawntruck_red_2.jpg']; 
	spawntruck_red enableRopeAttach false;
	spawntruck_red addMPEventHandler ["mpkilled",{["red",_this select 1] spawn respawnTruck}];
	spawntruck_red addEventHandler ["GetIn", {   _unit = _this select 2;   if (side _unit != east) then {    _veh = _this select 0;    _unit action ["eject", _veh];   };  }];
	spawntruck_red addEventHandler ["GetOut", {_this call CSG_water}];
	//[east, spawntruck_red] call BIS_fnc_addRespawnPosition;
	spawntruck_red setVariable["persistent",true];
	spawntruck_red setVariable["spawntruck_red",true];
	spawntruck_red addItemCargoGlobal ["ToolKit", 1];
	publicVariable "spawntruck_red";
};
if(_side == "red") then
{
	[360] execVM "koth_server\other_functions\stred_cool.sqf";
	_del = spawntruck_red;
	//[east, spawntruck_red] call BIS_fnc_removeRespawnPosition;
	//Kill
	if (_killerSide != east && isPlayer _killer) then
	{ 
		player_stats_add = [250,0,0];
		diag_log format["CSG: %1(%2) XP(%3) destroyed Red team spawn truck!",name _killer, faction _killer, player_stats_add];
		owner _killer publicVariableClient "player_stats_add";
	};
	
	spawntruck_red = 0;
	publicVariable "spawntruck_red";

	uisleep 60;
	deleteVehicle _del;

	uisleep 300;
	"redf" spawn respawnTruck;
};
// ********************************************************************
// ********************************************************************
if(_side == "indf") then
{
	spawntruck_ind = "B_Truck_01_covered_F" createVehicle (getMarkerPos "respawn_vehicle_guerrila");
	spawntruck_ind setDir (markerDir "respawn_vehicle_guerrila");
	spawntruck_ind setObjectTextureGlobal [0,'textures\spawntruck_green_1.jpg'];
	spawntruck_ind setObjectTextureGlobal [1,'textures\spawntruck_green_2.jpg']; 
	spawntruck_ind enableRopeAttach false;
	spawntruck_ind addMPEventHandler ["mpkilled",{["ind",_this select 1] spawn respawnTruck}];
	spawntruck_ind addEventHandler ["GetIn", {   _unit = _this select 2;   if (side _unit != resistance) then {    _veh = _this select 0;    _unit action ["eject", _veh];   };  }];
	spawntruck_ind addEventHandler ["GetOut", {_this call CSG_water}];
	//[resistance, spawntruck_ind] call BIS_fnc_addRespawnPosition;
	spawntruck_ind setVariable["persistent",true];
	spawntruck_ind setVariable["spawntruck_ind",true];
	spawntruck_ind addItemCargoGlobal ["ToolKit", 1];
	publicVariable "spawntruck_ind";
};
if(_side == "ind") then
{
	[360] execVM "koth_server\other_functions\stind_cool.sqf";
	_del = spawntruck_ind;
	//[resistance, spawntruck_ind] call BIS_fnc_removeRespawnPosition;
	//Kill
	if (_killerSide != resistance && isPlayer _killer) then
	{ 
		player_stats_add = [250,0,0];
		diag_log format["CSG: %1(%2) XP(%3) destroyed Green team spawn truck!",name _killer, faction _killer, player_stats_add];
		owner _killer publicVariableClient "player_stats_add";
	};
	
	spawntruck_ind = 0;
	publicVariable "spawntruck_ind";

	uisleep 60;
	deleteVehicle _del;

	uisleep 300;
	"indf" spawn respawnTruck;
};

