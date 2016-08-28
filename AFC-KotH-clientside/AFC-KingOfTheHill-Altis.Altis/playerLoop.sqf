while {true} do
{
	sleep 10;
	player enableFatigue false;
	player enableStamina false;
	player allowSprint true;
	player setCustomAimCoef 0.2;
	
	if (player distance (getMarkerPos "spawn_island") <= 600) then {
		_plrClass = typeOf player;
		_side = getNumber(configFile >> "cfgVehicles" >> _plrClass>> "side");
		_spawn = [0,0,0];
		switch (_side) do
		{
			case 0: {_spawn = getMarkerPos "respawn_east";}; 
			case 1: {_spawn = getMarkerPos "respawn_west";}; 
			case 2: {_spawn = getMarkerPos "respawn_guerrila";}; 	
		};
		player setpos _spawn;
	};

    //check if UI is alive. Reinit if not (eg. after loading) 
   if (isNull (uiNamespace getvariable ["statsDisplay",displayNull])) then 
    {	
        cutRsc ["statsScreen", "PLAIN"];  //show Resource
        
        //you can save the controls for easy access later to uinamespace vars
        with uiNamespace do
        {
            statsxp = statsDisplay displayCtrl 1000;
			statskills = statsDisplay displayCtrl 1001;
			
			statsblu = statsDisplay displayCtrl 1002;
			statsred = statsDisplay displayCtrl 1003;
			statsind = statsDisplay displayCtrl 1004;
			
			statsblucount 	= statsDisplay displayCtrl 1005;
			statsredcount 	= statsDisplay displayCtrl 1006;
			statsindcount 	= statsDisplay displayCtrl 1007;

        };
    };
    	
	uiNamespace setVariable ['tickets_blu', floor (TICKETS_BLU / 3)];
	uiNamespace setVariable ['tickets_red', floor (TICKETS_RED / 3)];
	uiNamespace setVariable ['tickets_ind', floor (TICKETS_IND / 3)];
	uiNamespace setVariable ['playerxp', player_stats select 0];
	
	_rankinfo = player_stats select 0 call getRankInfo;
	
	uiNamespace setVariable ['playerrank', _rankinfo select 0];
	uiNamespace setVariable ['playernextrank', _rankinfo select 1];
	uiNamespace setVariable ['playerkills', player_stats select 1];
	uiNamespace setVariable ['playerdeaths', player_stats select 2];
	
	uiNamespace setVariable ['blucount', playersNumber west];
	uiNamespace setVariable ['redcount', playersNumber east];
	uiNamespace setVariable ['greencount', playersNumber resistance];
		
    //update controls. ONLY uinamespace from this point
    with uiNamespace do
    {
		_output = format ["XP: %1/%2   Rank: %3", playerxp, playernextrank, playerrank];
        statsxp ctrlSetText _output;
        statsxp ctrlCommit 0.1; 
		
		_output = format ["Kills: %1   Deaths: %2", playerkills, playerdeaths];
		statskills ctrlSetText _output;
        statskills ctrlCommit 0.1; 
		
		statsblu ctrlSetText str tickets_blu;
        statsblu ctrlCommit 0.1; 
		
		statsblucount ctrlSetText str blucount;
        statsblucount ctrlCommit 0.1;
	
		statsred ctrlSetText str tickets_red;
        statsred ctrlCommit 0.1; 
		
		statsredcount ctrlSetText str redcount;
        statsredcount ctrlCommit 0.1;
		
		statsind ctrlSetText str tickets_ind;
        statsind ctrlCommit 0.1; 
		
		statsindcount ctrlSetText str greencount;
        statsindcount ctrlCommit 0.1;

    };
	
	if (TICKETS_BLU >= ticketsToWin * 3) then { execVM "other_functions\blue_win.sqf";};
	if (TICKETS_RED >= ticketsToWin * 3) then { execVM "other_functions\red_win.sqf";};
	if (TICKETS_IND >= ticketsToWin * 3) then { execVM "other_functions\green_win.sqf";};
};