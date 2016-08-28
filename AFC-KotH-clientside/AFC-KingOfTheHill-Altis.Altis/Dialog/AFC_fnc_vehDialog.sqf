
AFC_fnc_OpenVehUI = 
{	
	private ["_flag"];
	disableSerialization;
	player action ["WeaponOnBack", player];
	createDialog "rscAFCVehDialog";
	[] call AFC_gui_LoadVeh;
	_serverTitleCbo = ((findDisplay 1601) displayCtrl (10));
	_xp = player_stats select 0;
	_rankInfo = _xp call getRankInfo;
	_plrRank = _rankInfo select 0;
	_plr = profileName;
	_title = "AFC King Of The Hill";
	_serverTitleCbo ctrlSetStructuredText parseText format ["<t align='left'>%1 Level: %2</t><t align='right'>%3</t>",_plr, _plrRank, _title];
	_plrClass = typeOf player;
	_side = getNumber(configFile >> "cfgVehicles" >> _plrClass>> "side");
	_flagCbo = ((findDisplay 1601) displayCtrl (11));
	switch (_side) do
	{				
		case 0: {_flag = "\A3\Data_F\Flags\Flag_CSAT_CO.paa";}; 
		case 1: {_flag = "\A3\Data_F\Flags\Flag_nato_CO.paa";}; 
		case 2: {_flag = "\A3\Data_F\Flags\Flag_AAF_CO.paa";}; 	
	};
	_flagCbo ctrlSetText _flag;
};
AFC_gui_LoadVeh = 
{
	_cbo = ((findDisplay 1601) displayCtrl (7));
	lbCLear _cbo;
	_count =  count (missionConfigFile >> "AFCcfgMain" >> "AFC_cfg_Traders" >> "Vehicles");
	_quadCopters = ["O_UAV_01_F","B_UAV_01_F","I_UAV_01_F"];
	_plrClass = typeOf player;
	_plrSide = getNumber(configFile >> "cfgVehicles" >> _plrClass>> "side");
	_xp = player_stats select 0;
	_rankInfo = _xp call getRankInfo;
	_plrRank = _rankInfo select 0;
	for "_x" from 0 to (_count-1) do
	{
		_veh = ((missionConfigFile >> "AFCcfgMain" >> "AFC_cfg_Traders" >> "Vehicles") select _x);
		if (isClass _veh) then
		{	
			_class = configName _veh;
			_vehRank = getNumber(missionConfigFile >> "AFCcfgMain" >> "AFC_cfg_Traders" >> "Vehicles" >> _class >> "rank");
			if (_class == "B_UAV_01_F") then 
			{
				_class = _quadCopters select _plrSide;
			};			
			_index = _cbo lbAdd(getText(configFile >> "cfgVehicles" >> _class>> "displayName"));
			_cbo lbSetData[(lbSize _cbo)-1,  _class];
			_cbo lbSetValue[(lbSize _cbo)-1,  _vehRank];
			_picture = (getText(configFile >> "cfgVehicles" >> _class >> "picture"));
				_cbo lbSetPicture[(lbSize _cbo)-1,_picture];
			if (_plrRank <= _vehRank) then 
			{
				_cbo lbSetPicture[(lbSize _cbo)-1,"\A3\ui_f\data\map\mapcontrol\taskIconFailed_ca.paa"];			
			};	
		};
	};
};
AFC_gui_VehInfo = 
{
	private ["_class","_crewCount","_model","_maxSpeed","_invSpace","_armor"];
	disableSerialization;
	_id =  lbCurSel 7;
	_class = lbData [7, _id];
	_vehRank = lbValue [7, _id];
	_crewCount = [_class,true] call BIS_fnc_crewCount;
	_model = getText(configFile >> "cfgVehicles" >> _class >> "model");
	_maxSpeed = getNumber(configFile >> "cfgVehicles" >> _class >> "maxSpeed");
	_invSpace = getNumber(configFile >> "cfgVehicles" >> _class >> "maximumLoad");
	_armor = getNumber(configFile >> "cfgVehicles" >> _class >> "armor");
	_textCbo = ((findDisplay 1601) displayCtrl (8));
	_separator = parseText "-------------------------------------------------------------------------------------";
	_textCbo ctrlSetStructuredText parseText format 
["<t align='left'>Unlocks at:</t> <t align='right'>Level %1</t><br/>
<t align='left'>%6</t><br/>
<t align='left'>Passengers:</t> <t align='right'>%2</t><br/>
<t align='left'>%6</t><br/>
<t align='left'>Max Speed:</t> <t align='right'>%3</t><br/>
<t align='left'>%6</t><br/>
<t align='left'>Inventory:</t> <t align='right'>%4</t><br/>
<t align='left'>%6</t><br/>
<t align='left'>Armor:</t> <t align='right'>%5</t><br/>
<t align='left'>%6</t><br/>",_vehRank,_crewCount,_maxSpeed,_invSpace,_armor, _separator];	
};
AFC_gui_VehCreate = 
{
	private ["_coolTime"];
	_xp = player_stats select 0;
	_rankInfo = _xp call getRankInfo;
	_plrRank = _rankInfo select 0;
	_idVeh =  lbCurSel 7;
	_classVeh = lbData [7, _idVeh];
	_vehRank = lbValue [7,_idVeh];
	_donator = player_info select 1;
	if ((player_info select 0)>0) then
		{_coolTime = 120} else
	{
		switch (_donator) do
		{
			case 0: {_coolTime = 360};
			case 1: {_coolTime = 300};
			case 2: {_coolTime = 240};
			case 3: {_coolTime = 180};
		};
	};
	_plrClass = typeOf player;
	_plrSide = getNumber(configFile >> "cfgVehicles" >> _plrClass>> "side");
	_vehSpawns = ["vspawn_red","vspawn_blu","vspawn_ind"];
	_quadCopters = ["O_UAV_01_F","B_UAV_01_F","I_UAV_01_F"];
	_mrkr = _vehSpawns select _plrSide;
	_mrkrPos = getMarkerPos _mrkr;
	_emptyPos = _mrkrPos findEmptyPosition [0,50,_classVeh];
	if (_plrRank >= _vehRank)then
	{	
		if (!player_vcooldown) then
		{
			_info = player_stats select 0 call getRankInfo;
			_rank = _info select 0;
			player_vcooldown = true;
			_veh = createVehicle [_classVeh, getMarkerPos _mrkr, [], 0,""];
			_veh setDir (markerDir _mrkr);	
			if (_classVeh in _quadCopters) then {createVehicleCrew _veh;}
			else
			{
				clearWeaponCargoGlobal _veh;
				clearMagazineCargoGlobal _veh;
				clearItemCargoGlobal _veh;
				_veh disableTIEquipment true;
				_veh enableRopeAttach false;
				_veh addMPEventHandler ["mpkilled",{_this spawn deleteWreck}];
				[_veh, "despawnVehicle", false, false] spawn BIS_fnc_MP;
				player moveInDriver _veh;
			};
			_nil = [_coolTime] execVM "other_functions\vcool.sqf";
			closeDialog 1601;
		} else 
		{
		closeDialog 1601;
		_time = [((vcdleft)/60)+.01,"HH:MM"] call bis_fnc_timetostring;
		hint format ["Your vehicle cooldown is active. Please wait another %1 minutes!",_time];
		};
	}
	else
	{
		closeDialog 1601;
		["IntelAdded",["You are not a high enough level","\A3\ui_f\data\map\mapcontrol\taskIconFailed_ca.paa"]] call bis_fnc_showNotification;
	};
};

