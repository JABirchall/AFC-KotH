private["_text","_color"];
_text 	= _this select 0;
_color 	= _this select 1;
0 =[format["<t size='0.8' shadow='2' color='%1'>%2</t>",_color,_text], 0, 1, 5, 2, 0, 1] spawn bis_fnc_dynamictext;