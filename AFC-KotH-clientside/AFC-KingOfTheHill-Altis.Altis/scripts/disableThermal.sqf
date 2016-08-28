_layer = 85125; 

waitUntil {!isNil "player_info"};
_admin = player_info select 0;
if (_admin > 0) exitwith {};

while {true} do 
{ 
    if (currentVisionMode player == 2) then
        { 
            //hint "Thermals are active";
            _layer    cutText ["FLIR Mode Requires Maintenance. Please Turn off Thermals.","BLACK",-1];
			playSound "FD_CP_Not_Clear_F";
            waituntil {currentVisionMode player != 2};
            _layer cutText ["", "PLAIN"];
        };
        sleep 1; 
};