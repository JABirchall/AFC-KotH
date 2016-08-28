if (round_over) exitwith {};
_onScreenTime = 6;
sleep 10;
allowFire = nil;
playsound "EndSound";
round_over = true;

_role1 = "King of the Hill";
_role1names = ["Round is over"];
_role2 = "The Winner is";
_role2names = ["Team Red"];
{
	sleep 2;
	_memberFunction = _x select 0;
	_memberNames = _x select 1;
	_finalText = format ["<t size='0.60' color='#f2cb0b' align='right'>%1<br /></t>", _memberFunction];
	_finalText = _finalText + "<t size='0.60' color='#D8D8D8' align='right'>";
	{_finalText = _finalText + format ["%1<br />", _x]} forEach _memberNames;
	_finalText = _finalText + "</t>";
	_onScreenTime + (((count _memberNames) - 1) * 0.5);
	[
		_finalText,
		[safezoneX + safezoneW - 0.8,0.50],	//DEFAULT: 0.5,0.35
		[safezoneY + safezoneH - 0.8,0.7], 	//DEFAULT: 0.8,0.7
		_onScreenTime,
		0.5
	] spawn BIS_fnc_dynamicText;
	sleep (_onScreenTime);
} forEach [
	//The list below should have exactly the same amount of roles as the list above
	[_role1, _role1names],
	[_role2, _role2names]	//make SURE the last one here does NOT have a , at the end
];

3 enableChannel [true, false]; // Enable user ability to send text but disable voice on group

sleep 10;
redwin = 1;
publicVariableServer "redwin";

call KOTH_fnc_player_SaveStats;
