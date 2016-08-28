_xp = player_stats select 0;
_kills = player_stats select 1;
_deaths = player_stats select 2;

_stats = _this select 1;

_addxp = _stats select 0;
_addkills = _stats select 1;
_adddeaths = _stats select 2;

_newxp = _xp + _addxp;
_newkills = _kills + _addkills;
_newdeaths	= _deaths + _adddeaths;

if(_addxp > 0) then {_color="9900FF00"} else {_color="99FF0000"};

if ((_addxp >= 100 || _addxp <= -100) && _xp > 0) then
{
	0 = [format["<t size='0.6' shadow='2' color='#%2'>XP: %1</t>",_addxp,_color], 0, [safezoneY + safezoneH - 0.2,0.7], 2, 1, 0, 1] spawn bis_fnc_dynamictext;
};
//diag_log format["KOTH: xp:%1,k:%2,d:%3",_newxp, _newkills, _newdeaths];
player_stats = [_newxp, _newkills, _newdeaths];
