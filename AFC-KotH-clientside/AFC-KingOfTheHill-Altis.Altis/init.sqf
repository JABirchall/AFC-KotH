enableSaving [false, false];
enableRadio false;
enableSentences false;
0 fadeRadio 0;

//global vars
ticketsToWin = 200;
round_over = false;
restart_done = false;
bluewin = 0;
redwin = 0;
greenwin = 0;
player_trank = 0;
player_vcooldown = false;
player_savecooldown = false;
player_loadoutcooldown = false;
csg_jumping	= false;
allowFire = nil;
showScoretable 0;

// voice
0 enableChannel [false, false]; // Enable user ability to send text but disable voice on global channel
1 enableChannel [true, false]; // Enable user ability to send text but disable voice on side channel
2 enableChannel [false, false]; // Disable user ability to send text and voice on Command channel
3 enableChannel [true, false]; // Enable user ability to send text but disable voice on group
4 enableChannel [true, true]; // Disable user ability to send text and voice on Vehicle channel
5 enableChannel [true, true]; // Enable user ability to send text but disable voice on Direct channel
6 enableChannel [false, false]; // Disable user ability to send text and voice on System channel

[] execVM "briefing.sqf"; //Load Briefing

if(isNil "spawntruck_blu") then
{spawntruck_blu = 0;};

if(isNil "spawntruck_red") then
{spawntruck_red = 0;};

if(isNil "spawntruck_ind") then
{spawntruck_ind = 0;};

_descExtPath = str missionConfigFile;
currMissionDir = compileFinal str (_descExtPath select [0, count _descExtPath - 15]);

_weapDialog = [] spawn compile PreprocessFileLineNumbers "Dialog\AFC_fnc_WeapDialog.sqf";
waitUntil {scriptDone _weapDialog};
_vehDialog = [] spawn compile PreprocessFileLineNumbers "Dialog\AFC_fnc_vehDialog.sqf";
waitUntil {scriptDone _vehDialog};
//compile functions
displayMessage = compile preprocessFileLineNumbers "other_functions\displayMessage.sqf";
titleTextMessage = compile preprocessFileLineNumbers "other_functions\titletextmessage.sqf";
getRankInfo = compile preprocessFileLineNumbers "other_functions\getRankInfo.sqf";
getWeaponInfo = compile preprocessFileLineNumbers "other_functions\getWeaponInfo.sqf";
filterItem = compile preprocessFileLineNumbers "other_functions\filterItem.sqf";

KOTH_fnc_dynamictext = compile preprocessFileLineNumbers "scripts\fn_dynamictext.sqf";
KOTH_fnc_jump = compile preprocessFileLineNumbers "scripts\fn_jump.sqf";
KOTH_fnc_switchMoveGlobal = compile preprocessFileLineNumbers "scripts\fn_switchMoveGlobal.sqf";

KOTH_fnc_player_stats_load  = compileFinal preprocessFileLineNumbers "player\fn_playerStatsInit.sqf";
KOTH_fnc_player_stats_add   = compileFinal preprocessFileLineNumbers "player\fn_playerStatsAdd.sqf";
KOTH_fnc_player_getGear     = compileFinal preprocessFileLineNumbers "player\fn_playerLoadGear.sqf";
KOTH_fnc_player_setGear     = compileFinal preprocessFileLineNumbers "player\fn_playerSaveGear.sqf";
KOTH_fnc_player_SaveStats   = compileFinal preprocessFileLineNumbers "player\fn_playerSaveStats.sqf";

"player_stats_load" addPublicVariableEventHandler KOTH_fnc_player_stats_load;
"player_stats_add" 	addPublicVariableEventHandler KOTH_fnc_player_stats_add;
"player_getGear" 	addPublicVariableEventHandler KOTH_fnc_player_getGear;

KOTH_saveGearLocal = true;
KOTH_saveGearLocalServer = "AFC-Reloaded";

call compile preprocessFile "=BTC=_TK_punishment\=BTC=_tk_init.sqf";

["tagSystem", "onEachFrame",
{
    private["_pos"];
    {
		if (isPlayer _x) then
		{
			if(player distance _x < 800 && side _x == side player && alive _x && _x != player) then
			{
				_icon = switch (playerSide) do
				{
					case BLUFOR: { call currMissionDir + "images\igui_side_blufor_ca.paa" };
					case OPFOR:  { call currMissionDir + "images\igui_side_opfor_ca.paa" };
					default      { call currMissionDir + "images\igui_side_indep_ca.paa" };
				};
				
				_pos = visiblePosition _x;
				_pos set[2,(getPosATL _x select 2) + 2.2];
				
				_color = [1,1,1,0.5];

				if(player distance _x < 40) then
				{
					drawIcon3D [_icon,_color,_pos,0.5,0.5,0,name _x,2,0.04];
				} else
				{
					drawIcon3D [_icon,_color,_pos,0.5,0.5,0,"",2,0];
				};
			};
		};
    } forEach allUnits;
}] call BIS_fnc_addStackedEventHandler;

if(!isServer) then
{
    //Server
	waitUntil {(getPlayerUID player) != ""}; //Wait till the player is ready
	waitUntil {!isNil "locationmarkers"};
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
		
    waitUntil {uiSleep 0.1; (!(isNil "KOTH_backendReady"))};

    if (!KOTH_backendReady) then
    {
	    0 cutText["Error connecting to the server","BLACK FADED"];
	    0 cutFadeOut 9999999;
	    diag_log "KOTH: Error connecting to the server";
    }
    else
    {
        0 cutText["Loading stats, Might take a while please wait...","BLACK FADED"];
	    0 cutFadeOut 9999999;

        waitUntil {!isNull player};
        waitUntil {alive player};
		
        pvar_onPlayerGetStats = [player];
	    publicvariableServer "pvar_onPlayerGetStats";
	    waitUntil {uiSleep 0.1; (!(isNil "player_loaded"))};
	    diag_log "KOTH: player_loaded ready";

    	player addEventHandler ["respawn", {_this execVM "playerSpawned.sqf"}];
    	player addMPEventHandler ["mpkilled", {_this execVM "playerKilledServer.sqf"}];
    	player addEventHandler["InventoryOpened", {_this execVM "inventoryOpened.sqf"}];

    	_nil = execVM "initActions.sqf";
    	_nil = [] execVM "player_markers.sqf";
    	_nil = execVM "spawntruck_markers.sqf";
    	_nil = execVM "playerLoop.sqf";
    	_nil = execVM "playerSaveLoop.sqf";
    	_nil = execVM "safezone.sqf";
		
		player addRating 99999999;

    	_nil = [] execVM "playerSpawned.sqf";
    	null = execVM "scripts\killTicker.sqf";
    	_nil = [] spawn
    	{
    		waitUntil {!isNull findDisplay 46};

    		sleep 2;
    		1 cutRsc ["welcomeScreen", "PLAIN"];
    		sleep 3;
    		2 cutRsc ["welcomeScreen2", "PLAIN"];
    		sleep 3;
    		3 cutRsc ["welcomeScreen3", "PLAIN"];
    	};

        0 cutText ["","BLACK IN"];
    };
};

waitUntil {time > 0};
enableEnvironment false;

//CLIENTSIDE SCRIPTS
if (!isDedicated) then {
[] execVM "scripts\welcome.sqf";
[] execVM "scripts\baselights.sqf";
[] execVM "scripts\disableThermal.sqf";
[] execVM "scripts\afk_kick_loop.sqf";
};

if (isServer) then {
	null = [5, "scripts"] execVM "scripts\helipad_lights\helipad_light_auto.sqf";
};

[] spawn {
	while {true} do
	{
		waitUntil {!isNull (findDisplay 49)};
		((findDisplay 49) displayCtrl 122) ctrlEnable false;
		((findDisplay 49) displayCtrl 122) ctrlShow false;
		waitUntil {isNull (findDisplay 49)};
	};
};

[] execVM "scripts\DynamicWeatherEffects.sqf";
