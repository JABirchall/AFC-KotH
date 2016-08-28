/*
	File: .sqf
	Author: BAROD

	Description:
		NONE
	Parameters:
		NONE
*/

private["_data","_gear","_stats"];

_data = [];
_gear = [];
_loadoutid = _this select 0;

_uniformWeapons = [[],[]];
_uniformItems = [[],[]];
_uniformMagazines = [[],[]];
_vestWeapons = [[],[]];
_vestItems = [[],[]];
_vestMagazines = [[],[]];
_backpackWeapons = [[],[]];
_backpackItems = [[],[]];
_backpackMagazines = [[],[]];
_loadedMags = [];


_uniformContainer = uniformContainer player;
if (!(isNull _uniformContainer)) then {
	_uniformWeapons = getWeaponCargo _uniformContainer;
	_uniformItems = getItemCargo _uniformContainer;
	_uniformMagazines = magazinesAmmoCargo _uniformContainer;
}
else
{
	_uniformWeapons = [[],[]];
	_uniformItems = [[],[]];
	_uniformMagazines = [[],[]];
};

_vestContainer = vestContainer player;
if (!(isNull _vestContainer)) then {
	_vestWeapons = getWeaponCargo _vestContainer;
	_vestItems = getItemCargo _vestContainer;
	_vestMagazines = magazinesAmmoCargo _vestContainer;
}
else
{
	_vestWeapons = [[],[]];
	_vestItems = [[],[]];
	_vestMagazines = [[],[]];
};

_backpackContainer = backpackContainer player;
if (!(isNull _backpackContainer)) then {
	_backpackWeapons = getWeaponCargo _backpackContainer;
	_backpackItems = getItemCargo _backpackContainer;
	_backpackMagazines = magazinesAmmoCargo _backpackContainer;
}
else
{
	_backpackWeapons = [[],[]];
	_backpackItems = [[],[]];
	_backpackMagazines = [[],[]];
};

{
	_loaded = _x select 2;
	if (_loaded) then {
		_mag = _x select 0;
		_ammo = _x select 1;
		_type = _x select 3;
		if (_ammo > 0 && _type != 0) then {
			_loadedMags pushBack [_mag, _ammo];
		};
	};
} forEach magazinesAmmoFull player;

_gear pushBack headgear player;
_gear pushBack goggles player;
_gear pushBack uniform player;
_gear pushBack vest player;
_gear pushBack backpack player;
_gear pushBack primaryWeapon player;
_gear pushBack secondaryWeapon player;
_gear pushBack handgunWeapon player;
_gear pushBack primaryWeaponItems player;
_gear pushBack secondaryWeaponItems player;
_gear pushBack handgunItems player;
_gear pushBack assignedItems player;

_gear pushBack _uniformWeapons;
_gear pushBack _uniformItems;
_gear pushBack _uniformMagazines;
_gear pushBack _vestWeapons;
_gear pushBack _vestItems;
_gear pushBack _vestMagazines;
_gear pushBack _backpackWeapons;
_gear pushBack _backpackItems;
_gear pushBack _backpackMagazines;
_gear pushBack _loadedMags;

_data pushback getPlayerUID player;
_data pushback _loadoutid;
_data pushback _gear;

if(KOTH_saveGearLocal) then
{
	profileNamespace setVariable [format ["KOTH_PlayerStats_%1_%2_%3",KOTH_saveGearLocalServer, getPlayerUID player, _loadoutid],[_gear]];
	saveProfileNamespace;
}
else
{
	pvar_onPlayerSaveGear = _data;
	publicvariableServer "pvar_onPlayerSaveGear";
};
