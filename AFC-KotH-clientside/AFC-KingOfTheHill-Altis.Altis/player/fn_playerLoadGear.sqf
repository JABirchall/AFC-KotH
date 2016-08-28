/*
	File: fn_playerLoad.sqf
	Author: itsatrap
	Edit: "OH I LOST SOMETHING"-FIX by McDodelijk

	Description:
		NONE
	Parameters:
		NONE

*/
private [
"_loadout", "_illegal", "_ret", "_supporter", "_headgear", "_goggles", "_uniform", "_vest",
"_backpack", "_primaryWeapon", "_secondaryWeapon", "_handgunWeapon", "_primaryWeaponItems",
"_secondaryWeaponItems", "_handgunItems", "_assignedItems", "_uniformWeapons", "_uniformItems",
"_uniformMagazines", "_vestWeapons", "_vestItems", "_vestMagazines", "_backpackWeapons", "_backpackItems",
"_backpackMagazines", "_loadedMagazines", "_uniformContainer", "_vestContainer", "_backpackContainer",
"_type", "_muzzles"];

_selected 	=  profileNamespace getVariable [format["KOTH_PlayerStats_%1_%2_%3",KOTH_saveGearLocalServer, getPlayerUID player, _this select 0], false];

if(_selected isEqualType []) then
{
	_loadout 	= _selected select 0;
}
else
{
	_loadout = [];
};

_illegal 	= 0;
_ret 		= false;
if(count _loadout > 0) then
{
	_headgear = _loadout select 0;
	_goggles = _loadout select 1;
	_uniform = _loadout select 2;
	_vest = _loadout select 3;
	_backpack = _loadout select 4;

	_primaryWeapon = _loadout select 5;
	_secondaryWeapon = _loadout select 6;
	_handgunWeapon = _loadout select 7;

	_primaryWeaponItems = _loadout select 8;
	_secondaryWeaponItems = _loadout select 9;
	_handgunItems = _loadout select 10;
	_assignedItems = _loadout select 11;

	_uniformWeapons = _loadout select 12;
	_uniformItems = _loadout select 13;
	_uniformMagazines = _loadout select 14;

	_vestWeapons = _loadout select 15;
	_vestItems = _loadout select 16;
	_vestMagazines = _loadout select 17;

	_backpackWeapons = _loadout select 18;
	_backpackItems = _loadout select 19;
	_backpackMagazines = _loadout select 20;

	_loadedMagazines = _loadout select 21;

	removeAllWeapons player;
	removeAllAssignedItems player;
	removeUniform player;
	removeVest player;
	removeBackpack player;
	removeGoggles player;
	removeHeadgear player;


	player addBackpack "B_Carryall_Base";

	{
		player addItemToBackpack (_x select 0);
	} forEach _loadedMagazines;

	if (_primaryWeapon != "") then {
		_ret = (_primaryWeapon) call filterItem;
		if (!(_ret)) then
		{
			player addWeapon _primaryWeapon;
		} else {_illegal = 1;};
	};

	if (_secondaryWeapon != "") then {
		_ret = (_secondaryWeapon) call filterItem;
		if (!(_ret)) then
		{
			player addWeapon _secondaryWeapon;
		} else {_illegal = 1;};
	};
	if (_handgunWeapon != "") then {
		_ret = (_handgunWeapon) call filterItem;
		if (!(_ret)) then
		{
			player addWeapon _handgunWeapon;
		} else {_illegal = 1;};
	};

	removeAllPrimaryWeaponItems player;
	removeAllHandgunItems player;

	{
		if (_x != "") then {
			_ret = _x call filterItem;
			if (!(_ret)) then
			{
				player addPrimaryWeaponItem _x;
			} else {_illegal = 1;};
		};
	} forEach _primaryWeaponItems;

	{
		if (_x != "") then {
			_ret = _x call filterItem;
			if (!(_ret)) then
			{
				player addPrimaryWeaponItem _x;
			} else {_illegal = 1;};
		};
	} forEach _secondaryWeaponItems;

	{
		if (_x != "") then {
			_ret = _x call filterItem;
			if (!(_ret)) then
			{
				player addHandgunItem _x;
			} else {_illegal = 1;};
		};
	} forEach _handgunItems;

	removeBackpack player;

	if (_headgear != "") then {
		_ret = (_headgear) call filterItem;
		if (!(_ret)) then
		{
			if ((_headgear) in ["H_HelmetIA","H_HelmetB_desert","H_HelmetO_ocamo"]) then
			{
				if (side player == west) then {player addheadgear "H_HelmetB_desert";};
				if (side player == east) then {player addheadgear "H_HelmetO_ocamo";};
				if (side player == resistance) then {player addheadgear "H_HelmetIA";};
			} else
			{
				player addheadgear (_headgear);
			};
		} else {_illegal = 1;};
	};

	if (_goggles != "") then {
		player addGoggles _goggles;
	};

	if (_uniform != "") then {
		_ret = (_uniform) call filterItem;
		if (!(_ret)) then
		{
			call
			{
				// Ghilli
				if ((_uniform) in ["U_B_FullGhillie_ard","U_O_FullGhillie_ard","U_I_FullGhillie_ard"]) then
				{
					if (side player == west) 		exitWith {player addUniform "U_B_FullGhillie_ard";};
					if (side player == east) 		exitWith {player addUniform "U_O_FullGhillie_ard";};
					if (side player == resistance) 	exitWith {player addUniform "U_I_FullGhillie_ard";};
				};
				// Ghilli
				if ((_uniform) in ["U_B_FullGhillie_lsh","U_O_FullGhillie_lsh","U_I_FullGhillie_lsh"]) then
				{
					if (side player == west) 		exitWith {player addUniform "U_B_FullGhillie_lsh";};
					if (side player == east) 		exitWith {player addUniform "U_O_FullGhillie_lsh";};
					if (side player == resistance) 	exitWith {player addUniform "U_I_FullGhillie_lsh";};
				};
				// Ghilli
				if ((_uniform) in ["U_B_FullGhillie_sard","U_O_FullGhillie_sard","U_I_FullGhillie_sard"]) then
				{
					if (side player == west) 		exitWith {player addUniform "U_B_FullGhillie_sard";};
					if (side player == east) 		exitWith {player addUniform "U_O_FullGhillie_sard";};
					if (side player == resistance) 	exitWith {player addUniform "U_I_FullGhillie_sard";};
				};

				// Ghilli old
				if ((_uniform) in ["U_O_GhillieSuit","U_B_GhillieSuit","U_I_GhillieSuit"]) then
				{
					if (side player == west) 		exitWith {player addUniform "U_B_GhillieSuit";};
					if (side player == east) 		exitWith {player addUniform "U_O_GhillieSuit";};
					if (side player == resistance) 	exitWith {player addUniform "U_I_GhillieSuit";};
				};

				// Uniform 1
				if ((_uniform) in ["U_B_CombatUniform_mcam_vest","U_I_CombatUniform","U_B_CombatUniform_mcam","U_O_CombatUniform_ocamo"]) then
				{
					if (side player == west) 		exitWith {player addUniform "U_B_CombatUniform_mcam";};
					if (side player == east) 		exitWith {player addUniform "U_O_CombatUniform_ocamo";};
					if (side player == resistance) 	exitWith {player addUniform "U_I_CombatUniform";};
				};
				if (!(_uniform in ["U_B_FullGhillie_ard","U_O_FullGhillie_ard","U_I_FullGhillie_ard","U_B_FullGhillie_lsh","U_O_FullGhillie_lsh","U_I_FullGhillie_lsh","U_B_FullGhillie_sard","U_O_FullGhillie_sard","U_I_FullGhillie_sard","U_O_GhillieSuit","U_B_GhillieSuit","U_I_GhillieSuit","U_B_CombatUniform_mcam_vest","U_I_CombatUniform","U_B_CombatUniform_mcam","U_O_CombatUniform_ocamo"])) then
				{
					player addUniform _uniform;
				};
			};
		} else {_illegal = 1;};
	};

	if (_vest != "") then {
		_ret = (_vest) call filterItem;
		if (!(_ret)) then
		{
			player AddVest (_vest);
		} else {_illegal = 1;};
	};

	if (_backpack != "") then {
		_ret = (_backpack) call filterItem;
		if (!(_ret)) then
		{
			player addBackpack (_backpack);
		} else {_illegal = 1;};
	};

	{
		player removeItemFromBackpack _x;
	} forEach backpackItems player;

	_uniformContainer = uniformContainer player;
	_vestContainer = vestContainer player;
	_backpackContainer = backpackContainer player;


	{
		if (_x != "") then {
			_ret = _x call filterItem;
			if (!(_ret)) then
			{
				call
				{
					if (_x in ["B_UavTerminal","O_UavTerminal","I_UavTerminal"]) then
					{
						if (side player == west) 		exitWith {player linkItem "B_UavTerminal";};
						if (side player == east) 		exitWith {player linkItem "O_UavTerminal";};
						if (side player == resistance) 	exitWith {player linkItem "I_UavTerminal";};
					};

					if (_x in ["Laserdesignator","Laserdesignator_02","Laserdesignator_03"]) then
					{
						if (side player == west) 		exitWith {player AddWeapon "Laserdesignator";};
						if (side player == east) 		exitWith {player AddWeapon "Laserdesignator_02"};
						if (side player == resistance) 	exitWith {player AddWeapon "Laserdesignator_03";};
					};
					if (_x in ["Binocular","Rangefinder"]) exitWith {player AddWeapon _x;};
					
					if (!(_x in ["B_UavTerminal","O_UavTerminal","I_UavTerminal","Laserdesignator","Laserdesignator_02","Laserdesignator_03","Binocular","Rangefinder"])) then
					{
						player linkItem _x;
					};
				};
			} else {_illegal = 1;};
		};
	} forEach _assignedItems;

	{
		_ret = _x call filterItem;
		if (!(_ret)) then
		{
			_uniformContainer addWeaponCargoGlobal [_x, (_uniformWeapons select 1) select _forEachIndex];
		} else {_illegal = 1;};
	} forEach (_uniformWeapons select 0);

	{
		_ret = _x call filterItem;
		if (!(_ret)) then
		{
			_uniformContainer addItemCargo [_x, (_uniformItems select 1) select _forEachIndex];
		} else {_illegal = 1;};
	} forEach (_uniformItems select 0);

	{
		if ((count _x) > 0) then {
			_ret = (_x select 0) call filterItem;
			if (!(_ret)) then
			{
				//_uniformContainer addMagazineAmmoCargo [(_x select 0), 1, (_x select 1)];
				player addItemToUniform (_x select 0);
			} else {_illegal = 1;};
		};
	} forEach _uniformMagazines;


	{
		_ret = _x call filterItem;
		if (!(_ret)) then
		{
			_vestContainer addWeaponCargoGlobal [_x, (_vestWeapons select 1) select _forEachIndex];
		} else {_illegal = 1;};
	} forEach (_vestWeapons select 0);

	{
		_ret = _x call filterItem;
		if (!(_ret)) then
		{
			_vestContainer addItemCargo [_x, (_vestItems select 1) select _forEachIndex];
		} else {_illegal = 1;};
	} forEach (_vestItems select 0);

	{
		if ((count _x) > 0) then {
			_ret = (_x select 0) call filterItem;
			if (!(_ret)) then
			{
				player addItemToVest (_x select 0);
			} else {_illegal = 1;};
		};
	} forEach _vestMagazines;

	{
		_ret = _x call filterItem;
		if (!(_ret)) then
		{
			_backpackContainer addWeaponCargoGlobal [_x, (_backpackWeapons select 1) select _forEachIndex];
		} else {_illegal = 1;};
	} forEach (_backpackWeapons select 0);

	{
		_ret = _x call filterItem;
		if (!(_ret)) then
		{
			_backpackContainer addItemCargo [_x, (_backpackItems select 1) select _forEachIndex];
		} else {_illegal = 1;};
	} forEach (_backpackItems select 0);
	{
		if ((count _x) > 0) then {
			_ret = (_x select 0) call filterItem;
			if (!(_ret)) then
			{
				player addItemToBackpack (_x select 0);
			} else {_illegal = 1;};
		};
	} forEach _backpackMagazines;
}
else
{
	["Error getting loadout, Try saving a new one!","#99ffffff"] call KOTH_fnc_dynamictext;
};

if (_illegal == 1) then
{
	["Your rank is not high enough for some of the items you saved!","#99ffffff"] call KOTH_fnc_dynamictext;
};

if ( (primaryWeapon player) != "") then
{
	private['_type', '_muzzles'];
	_type = primaryWeapon player;
	_muzzles = getArray(configFile >> "cfgWeapons" >> _type >> "muzzles");

	if (count _muzzles > 1) then
	{
		player selectWeapon (_muzzles select 0);
	}
	else
	{
		player selectWeapon _type;
	};
};