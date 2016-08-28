enableRadio false;
enableSentences false;
0 fadeRadio 0;

waitUntil {!isNull player};
waitUntil {alive player};

removeAllWeapons player;
removeBackpack player;
removeVest player;

player addAction ["", {}, "", 0, false, true, "DefaultAction", "isNil 'allowFire'"];

if (side player == west) then {
	player addAction["buy Magazine",{_weap = currentWeapon player; _mags = getArray(configFile >> "CfgWeapons" >> _weap >> "magazines"); player addmagazine (_mags select 0);},"",0,false,false,"",'(typeOf cursorTarget == "B_Truck_01_covered_F") && (getDammage cursorTarget < 1) && (player distance cursorTarget <= 7) && ((if(typeName spawntruck_blu == "OBJECT") then {(cursortarget == spawntruck_blu)}))'];
};
if (side player == east) then {
	player addAction["buy Magazine",{_weap = currentWeapon player; _mags = getArray(configFile >> "CfgWeapons" >> _weap >> "magazines"); player addmagazine (_mags select 0);},"",0,false,false,"",'(typeOf cursorTarget == "B_Truck_01_covered_F") && (getDammage cursorTarget < 1) && (player distance cursorTarget <= 7) && ((if(typeName spawntruck_red == "OBJECT") then {(cursortarget == spawntruck_red)}))'];
};
if (side player == resistance) then {
	player addAction["buy Magazine",{_weap = currentWeapon player; _mags = getArray(configFile >> "CfgWeapons" >> _weap >> "magazines"); player addmagazine (_mags select 0);},"",0,false,false,"",'(typeOf cursorTarget == "B_Truck_01_covered_F") && (getDammage cursorTarget < 1) && (player distance cursorTarget <= 7) && ((if(typeName spawntruck_ind == "OBJECT") then {(cursortarget == spawntruck_ind)}))'];
};

3 enableChannel [true, true]; // Enable user ability to send text and voice on group

sleep 1;

_admin = player_info select 0;
_donator = player_info select 1;

if ((_donator >= 1) || (_admin > 0)) then {
	[4] call KOTH_fnc_player_getGear;
	};