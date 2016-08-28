// 	File: afk_kick_loop.sqf
//	Author: BrezZZz
//  Edit: AFC~Gagi2~

waitUntil {!isNil "player_info"};
_admin = player_info select 0;
if (_admin > 0) exitwith {};
while {true} do {

sleep 10;

	if (actCount == 15) then {titleText ["AFK-Kicker: Move or get Kicked for AFK in 2 Minutes", "PLAIN"];};
	if (actCount == 18) then {titleText ["AFK-Kicker: Move or get Kicked for AFK in 1 Minute", "PLAIN"];};	
	if (actCount == 21) then {player setVariable ["AFKinBase", true, true];};	

	
	switch (caseAFK) do {
		case 0: { 
			actPos = getPos player;
			StringActPos = str actPos;			
			caseAFK = 1;
		};
		
		case 1: { 			
			actPos2 = getPos player;
			StringActPos2 = str actPos2;
			caseAFK = 2;
		};
		
		case 2: { 
			if (StringActPos == StringActPos2) then {
				actCount = actCount+1; //
				caseAFK = 1;
			}
			else {	
				actCount = 0;
				caseAFK = 0;
			};	
		};
		default { hint "Error" };
						};
};