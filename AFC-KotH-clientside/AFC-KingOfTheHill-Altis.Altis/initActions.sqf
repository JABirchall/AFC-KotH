flagpole_blu addAction ["Teleport to Spawn-Truck", {
if(typeName spawntruck_blu == "OBJECT") then
{
	_this select 1 moveincargo spawntruck_blu;
	player removeAllEventHandlers "handleDamage";
	player addEventHandler ["handleDamage", {false}];
	player allowDamage false;
	[format ["spawnprotection enabled"], "titleTextMessage", player, false] spawn BIS_fnc_MP;
	sleep 10;
	player allowDamage true;
	player addEventHandler ["handleDamage", {true}];
	player removeAllEventHandlers "handleDamage";
	[format ["spawnprotection disabled"], "titleTextMessage", player, false] spawn BIS_fnc_MP;
}
else{
	hint format ["Truck was destroyed and will respawn in approximately %1 minutes.", [((time_blue)/60)+.01,"HH:MM"] call bis_fnc_timetostring];
};
}];
flagpole_blu addAction ["Save stats manually", {
	if (!player_savecooldown) then
	{
		player_savecooldown = true;
		pvar_onPlayerSaveStats = [player, player_stats];
		publicvariableServer "pvar_onPlayerSaveStats";
		hint "Your stats were saved manually on the server.";
		_nil = [60] execVM "other_functions\scool.sqf";
		sleep 60;
		player_savecooldown = false;
	} else {hint format ["Your player save cooldown is active. Please wait another %1 seconds!",scdleft];};
}];
flagpole_red addAction ["Teleport to Spawn-Truck", {
if(typeName spawntruck_red == "OBJECT") then
{
	_this select 1 moveincargo spawntruck_red;
	player removeAllEventHandlers "handleDamage";
	player addEventHandler ["handleDamage", {false}];
	player allowDamage false;
	[format ["spawnprotection enabled"], "titleTextMessage", player, false] spawn BIS_fnc_MP;
	sleep 10;
	player allowDamage true;
	player addEventHandler ["handleDamage", {true}];
	player removeAllEventHandlers "handleDamage";
	[format ["spawnprotection disabled"], "titleTextMessage", player, false] spawn BIS_fnc_MP;
}
else{
	hint format ["Truck was destroyed and will respawn in approximately %1 minutes.", [((time_red)/60)+.01,"HH:MM"] call bis_fnc_timetostring];
};
}];
flagpole_red addAction ["Save stats manually", {
	if (!player_savecooldown) then
	{
		player_savecooldown = true;
		pvar_onPlayerSaveStats = [player, player_stats];
		publicvariableServer "pvar_onPlayerSaveStats";
		hint "Your stats were saved manually on the server.";
		_nil = [60] execVM "other_functions\scool.sqf";
		sleep 60;
		player_savecooldown = false;
	} else {hint format ["Your player save cooldown is active. Please wait another %1 seconds!",scdleft];};
}];
flagpole_ind addAction ["Teleport to Spawn-Truck", {
if(typeName spawntruck_ind == "OBJECT") then
{
	_this select 1 moveincargo spawntruck_ind;
	player removeAllEventHandlers "handleDamage";
	player addEventHandler ["handleDamage", {false}];
	player allowDamage false;
	[format ["spawnprotection enabled"], "titleTextMessage", player, false] spawn BIS_fnc_MP;
	sleep 10;
	player allowDamage true;
	player addEventHandler ["handleDamage", {true}];
	player removeAllEventHandlers "handleDamage";
	[format ["spawnprotection disabled"], "titleTextMessage", player, false] spawn BIS_fnc_MP;
}
else{
	hint format ["Truck was destroyed and will respawn in approximately %1 minutes.", [((time_ind)/60)+.01,"HH:MM"] call bis_fnc_timetostring];
};
}];
flagpole_ind addAction ["Save stats manually", {
	if (!player_savecooldown) then
	{
		player_savecooldown = true;
		pvar_onPlayerSaveStats = [player, player_stats];
		publicvariableServer "pvar_onPlayerSaveStats";
		hint "Your stats were saved manually on the server.";
		_nil = [60] execVM "other_functions\scool.sqf";
		sleep 60;
		player_savecooldown = false;
	} else {hint format ["Your player save cooldown is active. Please wait another %1 seconds!",scdleft];};
}];

_weapTraders = [trader_weapons_blu,trader_weapons_red,trader_weapons_ind];
_vehTraders = [trader_cars_blu,trader_cars_red,trader_cars_ind];
{
	_x addAction ["<t color=""#ff3300"">" + ("Weapon Selector") + "</t>", {[] call AFC_fnc_OpenWeapUI;}];
}forEach _weapTraders;
{
	_x addAction ["<t color=""#ff3300"">" + ("Vehicle Selector") + "</t>", {[] call AFC_fnc_OpenVehUI;}];
}forEach _vehTraders;

_admin = player_info select 0;
_donator = player_info select 1;
_cargobox = [cargobox_blu,cargobox_red,cargobox_ind];

{
	_x addAction ["<t color='#04B404'>Equip saved Loadout ONE</t>", {
		if(!player_loadoutcooldown) then
		{
			player_loadoutcooldown = true;
			hint "Your loadout will load now. Please wait!";
			[1] call KOTH_fnc_player_getGear;
			_nil = [30] execVM "other_functions\lcool.sqf";
			sleep 30;
			player_loadoutcooldown = false;
		} else {hint format ["Your loadout cooldown is active. Please wait another %1 seconds!",lcdleft];};
	}];
}forEach _cargobox;

{
	_x addAction ["<t color='#04B404'>Equip saved Loadout TWO</t>", {
		if(!player_loadoutcooldown) then
		{
			player_loadoutcooldown = true;
			hint "Your loadout will load now. Please wait!";
			[2] call KOTH_fnc_player_getGear;
			_nil = [30] execVM "other_functions\lcool.sqf";
			sleep 30;
			player_loadoutcooldown = false;
		} else {hint format ["Your loadout cooldown is active. Please wait another %1 seconds!",lcdleft];};
	}];
}forEach _cargobox;

{
	_x addAction ["<t color='#04B404'>Equip saved Loadout THREE</t>", {
		if(!player_loadoutcooldown) then
		{
			player_loadoutcooldown = true;
			hint "Your loadout will load now. Please wait!";
			[3] call KOTH_fnc_player_getGear;
			_nil = [30] execVM "other_functions\lcool.sqf";
			sleep 30;
			player_loadoutcooldown = false;
		} else {hint format ["Your loadout cooldown is active. Please wait another %1 seconds!",lcdleft];};
	}];
}forEach _cargobox;

if ((_donator >= 1) || (_admin > 0)) then {
	{
		_x addAction ["<t color='#00F000'>Equip saved Loadout FOUR *</t>", {
			if(!player_loadoutcooldown) then
			{
				player_loadoutcooldown = true;
				hint "Your loadout will load now. Please wait!";
				[4] call KOTH_fnc_player_getGear;
				_nil = [30] execVM "other_functions\lcool.sqf";
				sleep 30;
				player_loadoutcooldown = false;
			} else {hint format ["Your loadout cooldown is active. Please wait another %1 seconds!",lcdleft];};
		}];
	}forEach _cargobox;
};

if ((_donator >= 2) || (_admin > 0)) then {
	{
		_x addAction ["<t color='#00F000'>Equip saved Loadout FIVE **</t>", {
			if(!player_loadoutcooldown) then
			{
				player_loadoutcooldown = true;
				hint "Your loadout will load now. Please wait!";
				[5] call KOTH_fnc_player_getGear;
				_nil = [30] execVM "other_functions\lcool.sqf";
				sleep 30;
				player_loadoutcooldown = false;
			} else {hint format ["Your loadout cooldown is active. Please wait another %1 seconds!",lcdleft];};
		}];
	}forEach _cargobox;
};

if ((_donator >= 3) || (_admin > 0)) then {
	{
		_x addAction ["<t color='#00F000'>Equip saved Loadout SIX ***</t>", {
			if(!player_loadoutcooldown) then
			{
				player_loadoutcooldown = true;
				hint "Your loadout will load now. Please wait!";
				[6] call KOTH_fnc_player_getGear;
				_nil = [30] execVM "other_functions\lcool.sqf";
				sleep 30;
				player_loadoutcooldown = false;
			} else {hint format ["Your loadout cooldown is active. Please wait another %1 seconds!",lcdleft];};
		}];
	}forEach _cargobox;
};