/*
	File: onkeypress.sqf
	Author: itsatrap
	
	Description:
		Executed locally when player press a key.
	Parameters:
		NONE
*/
if !(alive player) exitWith{ false };
private ["_key", "_shift", "_ctrl", "_alt", "_handled", "_killticker"];

_key 	= _this select 1;
_shift 	= _this select 2;
_ctrl 	= _this select 3;
_alt 	= _this select 4;

_handled = false;
//hintSilent format["key: %1, shift: %2, ctrl: %3, alt: %4",_key,_shift,_ctrl,_alt];

// Disable 0..9
if (_key in[0x02,0x03,0x04,0x58,0x57,0x44,0x43,0x42,0x41,0x40,0x3F,0x3E,0x3D,0x3C,0x3B,0x0B,0x0A,0x09,0x08,0x07,0x06,0x05]) then {
	_handled = true;
};

switch (true) do {
//	case (_key in actionKeys "networkStats" ): {_handled = true;};
	case (_key in actionKeys "ForceCommandingMode" ): {_handled = true;};
	case (_key in actionKeys "SelectAll"): {_handled = true;};
	case (_key in actionKeys "TacticalView" ): {_handled = true;};
	case (_key in actionKeys "DefaultAction" ): {if (isNil "allowFire") then {_handled = true;}};
	case (_key in actionKeys "Throw" ): {if (isNil "allowFire") then {_handled = true;}};
	
	case (_key in actionKeys "GetOver") : {
		if (!csg_jumping && (primaryWeapon player != "") && (currentWeapon player == primaryWeapon player) && speed player > 5) then
		{
			[] spawn KOTH_fnc_jump;
			_handled = true;
		};
	};
};
// ********** Hardcoded keys **********
switch (_key) do
{
	// 1 for primaryWeapon
	case 0x02:
	{
		player selectWeapon primaryWeapon player;
		_handled = true;
	};
	// 2 for secondaryWeapon
	case 0x03:
	{
		player selectWeapon handgunWeapon player;
		_handled = true;
	};
	// 3 for secondaryWeapon
	case 0x04:
	{
		player selectWeapon secondaryWeapon player;
		_handled = true;
	};

	// H - Holster weapon
	case 0x23:
	{
		if (currentweapon player != "") then
		{
			CSG_Holstered = currentweapon player;
			player action["switchWeapon", player, player, 100];
			player switchCamera cameraView;
		}
		else
		{
			if (CSG_Holstered != "") then{
				player selectWeapon CSG_Holstered;
			};
		};
		_handled = true;
	};

	// 5 - Earplugs
	case 0x06:
	{
		if (soundVolume != 1) then
		{
		1 fadeSound 1;
		["Sound back to normal.","#99ffffff"] call KOTH_fnc_dynamictext;
		}
		else
		{
		1 fadeSound 0.2;
		["Sound lowered to 20%.","#99ffffff"] call KOTH_fnc_dynamictext;
		};
		_handled = true;
	};
	
	// Toggle killTicker
	case 210 :
	{
		_killTicker = player getVariable "hideticker";
		if (_killTicker) then
		{
			player setVariable["hideticker",false];
			["You turned kill Ticker on!","#99ffffff"] call KOTH_fnc_dynamictext;
		}
		else
		{
			player setVariable["hideticker",true];
			["You turned kill Ticker off!","#99ffffff"] call KOTH_fnc_dynamictext;
		};
		_handled = true;
	};
};
_handled
