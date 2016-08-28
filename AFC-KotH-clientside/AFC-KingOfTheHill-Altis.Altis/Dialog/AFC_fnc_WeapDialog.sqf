player_stats = [200000,0];
player_info = [0,1];
AFC_fnc_OpenWeapUI = 
{
	disableSerialization;
	createDialog "rscAFCweapDialog";
	[] call AFC_fnc_PlayerInfo;
	[1] call AFC_fnc_CurrentWeap;
	call AFC_fnc_LoadLoadouts; 
	call AFC_fnc_WeightInfo;
};
AFC_fnc_AddWeap = 
{
	private ["_oldWeap","_currMags"];
	_cboList = ((findDisplay 1501) displayCtrl (14));
	_id =  lbCurSel 14;
	_classWeap = lbData [14, _id];
	_weapRank = lbValue [14, _id];		
	_xp = player_stats select 0;
	_rankInfo = _xp call getRankInfo;
	_plrRank = _rankInfo select 0;
	if (_weapRank < _plrRank + 1) then
	{
	_type = getnumber (configFile >> "CfgWeapons" >> _classWeap >> "type");
			switch (_type) do
	{				
		case 1: {_oldWeap = primaryWeapon player; _currMags = (magazines player) + (primaryWeaponMagazine player);}; 
		case 2: {_oldWeap = handgunWeapon player;_currMags = (magazines player) + (handgunMagazine player);}; 
		case 4: {_oldWeap = secondaryWeapon player;_currMags = (magazines player) + (secondaryWeaponMagazine player);}; 	
	};
	{
		_possMags = getArray(configFile >> "CfgWeapons" >> _oldWeap >> "magazines");
		_count = count _possMags;
		for "_i" from 0 to (_count-1) do
		{
			_possMag = _possMags select _i;
			if (_possMag == _x) then
			{
			 player removeMagazine _x;
			};
		};
	}forEach _currMags;
	_mags = getArray(configFile >> "CfgWeapons" >> _classWeap >> "magazines");
	_mag = _mags select 0;
	player addMagazine _mag;
	player addWeapon _classWeap;
	player selectWeapon _classWeap;
	_type = getNumber(configFile >> "CfgWeapons" >> _classWeap >> "type");
	call AFC_fnc_WeightInfo;
	[_type] call AFC_fnc_CurrentWeap;
	call AFC_fnc_CountMags;
	}else
	{
	_currentWeapCbo = ((findDisplay 1501) displayCtrl (18));
	_currentWeapCbo ctrlSetStructuredText parseText format ["<t align='left'>Current</t> <t align='right'>Unlocks at Lvl: %1</t>",_weapRank];
	};
};
AFC_fnc_AttachItem = 
{
	_itemCbo = _this select 0;
	_idWeap =  lbCurSel 14;
	_weap = lbData [14, _idWeap];
	_idItem = lbCurSel _itemCbo;
	_item = lbData [_itemCbo, _idItem];
	_itemRank = lbValue [_itemCbo, _idItem];
	_xp = player_stats select 0;
	_rankInfo = _xp call getRankInfo;
	_plrRank = _rankInfo select 0;
	if (_itemRank < _plrRank + 1) then
	{
		_type = (getnumber(configFile >> "cfgWeapons" >> _weap >> "type"));
		switch (_type) do
		{				
			case 1:{player addPrimaryWeaponItem _item ;};
			case 2:{player addHandgunItem _item;};
			case 4:{player addSecondaryWeaponItem _item;};
		};
	};		
};
AFC_fnc_LoadWeap = 
{
	private ["_cfg"];
	_type = _this select 0;
		switch (_type) do
	{				
		case 1: {_cfg = "Primaries";}; 
		case 2: {_cfg = "Secondaries";}; 
		case 4: {_cfg = "Launchers";}; 	
	};
	
	_cbo = ((findDisplay 1501) displayCtrl (14));
	lbCLear _cbo;
	_xp = player_stats select 0;
	_rankInfo = _xp call getRankInfo;
	_plrRank = _rankInfo select 0;
	_count =  count (missionConfigFile >> "AFCcfgMain" >> "AFC_cfg_Traders" >> _cfg);
	for "_x" from 0 to (_count-1) do
	{
		_weap = ((missionConfigFile >> "AFCcfgMain" >> "AFC_cfg_Traders" >> _cfg) select _x);
		if (isClass _weap) then
		{	
			_class = configName _weap;
			_weapRank = getNumber(missionConfigFile >> "AFCcfgMain" >> "AFC_cfg_Traders" >> _cfg >> _class >> "rank");
			_index = _cbo lbAdd(getText(configFile >> "cfgWeapons" >> _class >> "displayName"));
			_cbo lbSetData[(lbSize _cbo)-1,  _class];
			_cbo lbSetValue[(lbSize _cbo)-1,  _weapRank];			
			if (_weapRank < _plrRank + 1) then
			{
				_picture = (getText(configFile >> "cfgWeapons" >> _class >> "picture"));
				_cbo lbSetPicture[(lbSize _cbo)-1,_picture];
			} else
			{
				_picture = "\A3\ui_f\data\map\mapcontrol\taskIconFailed_ca.paa";
				_cbo lbSetPicture[(lbSize _cbo)-1,_picture];
			};		
		};
	};
};
AFC_fnc_LoadAmmo = 
{
	_xp = player_stats select 0;
	_rankInfo = _xp call getRankInfo;
	_plrRank = _rankInfo select 0;
	_classArray = [(primaryWeapon player),(handgunWeapon player),(secondaryWeapon player)];
	_ammoCbo = ((findDisplay 1501) displayCtrl (29));
	lbCLear _ammoCbo;
	{

		_mags = getArray(configFile >> "CfgWeapons" >> _x >> "magazines");
		_count =  count _mags;	
		for "_i" from 0 to (_count-1) do
		{
			_mag = (_mags select _i);
			if (_mag != "5Rnd_127x108_APDS_Mag") then
			{
				_displayName = getText(configFile >> "CfgMagazines">> _mag >> "displayName");
				_ammoCbo lbAdd _displayName;
				_ammoCbo lbSetData[(lbSize _ammoCbo)-1,_mag];
				_tracers = getNumber(configFile >> "CfgMagazines">> _mag >> "tracersEvery");
				if ((_tracers == 0) || (_tracers > 0) && (_plrRank > 7)) then
				{
					_picture = getText(configFile >> "CfgMagazines">> _mag >> "picture");
					_ammoCbo lbSetPicture[(lbSize _ammoCbo)-1,_picture];
					_ammoCbo lbSetValue[(lbSize _ammoCbo)-1,  1];	
				} else
				{
					_picture = "\A3\ui_f\data\map\mapcontrol\taskIconFailed_ca.paa";
					_ammoCbo lbSetPicture[(lbSize _ammoCbo)-1,_picture];
					_ammoCbo lbSetValue[(lbSize _ammoCbo)-1,  0];
				};
			};
		};	
	}forEach _classArray;
	_ammoCbo lbSetCurSel 0;
};
AFC_fnc_CountMags =
{
	_magTextCbo = ((findDisplay 1501) displayCtrl (30));
	_id =  lbCurSel 29;
	_mag = lbData [29, _id];
	_mags = (magazines player)+(primaryWeaponMagazine player)+(secondaryWeaponMagazine player)+(handgunMagazine player);
	_count = {_x == _mag} count _mags;
	_magTextCbo ctrlSetStructuredText parseText format ["<t align='left'>Magazines</t> <t align='right'>%1</t>",_count];
};

AFC_fnc_CountItems =
{
	_itemTextCbo = ((findDisplay 1501) displayCtrl (42));
	_id =  lbCurSel 41;
	_item = lbData [41, _id];
	_itemRank = lbValue[41, _id];
	_xp = player_stats select 0;
	_rankInfo = _xp call getRankInfo;
	_plrRank = _rankInfo select 0;
	if (_itemRank < _plrRank + 1) then
	{
		if (isClass (configFile >> "cfgMagazines" >>  _item)) then
		{	 
		_mags = (magazines player)+(primaryWeaponMagazine player)+(secondaryWeaponMagazine player)+(handgunMagazine player);
		_count = {_x == _item} count _mags;
		_itemTextCbo ctrlSetStructuredText parseText format ["<t align='left'>Items</t> <t align='right'>%1</t>",_count];
		} else
		{
		_items = items player;
		_count = {_x == _item} count _items;
		_itemTextCbo ctrlSetStructuredText parseText format ["<t align='left'>Items</t> <t align='right'>%1</t>",_count];
		};
	} else
	{
	_itemTextCbo ctrlSetStructuredText parseText format ["<t align='left'>Items</t><t align='right'>Unlocks at Lvl: %1</t>",_itemRank];
	};
};

AFC_fnc_AddMags = 
{
	_add = _this select 0;
	_id =  lbCurSel 29;
	_mag = lbData [29, _id];
	_unlocked = lbValue [29, _id];
	if (_unlocked == 1) then
	{
		switch (_add) do
			{				
				case 0: {player removeMagazine _mag;}; 
				case 1: {player addMagazine _mag;};	
			};
		call AFC_fnc_CountMags;
		call AFC_fnc_WeightInfo;
	};
};
AFC_fnc_AddItems = 
{
	_add = _this select 0;
	_id =  lbCurSel 41;
	_item = lbData [41, _id];
	_itemRank = lbValue [41, _id];
	_itemTextCbo = ((findDisplay 1501) displayCtrl (42));
	_xp = player_stats select 0;
	_rankInfo = _xp call getRankInfo;
	_plrRank = _rankInfo select 0;
	if (_itemRank < _plrRank + 1) then
	{
			if (isClass (configFile >> "cfgMagazines" >>  _item)) then
			{
				
				switch (_add) do
					{				
						case 0: {player removeMagazine _item;}; 
						case 1: {player addMagazine _item;};	
					};
				call AFC_fnc_CountItems;
				call AFC_fnc_WeightInfo;
			} else
			{
				switch (_add) do
					{				
						case 0: {player removeItem _item;}; 
						case 1: {player addItem _item;};	
					};
					call AFC_fnc_CountItems;
					call AFC_fnc_WeightInfo;
			};
	};
};
AFC_fnc_LoadAttachments = 
{
	call AFC_fnc_AddWeap;
	private ["_slot","_attachCtrl"];
	_opticCtrl = 25;
	_muzzleCtrl = 23;
	_pointerCtrl = 21;
	_bipodCtrl = 19;
	{lbCLear _x;} forEach [25,23,21,19];
	_weapCbo = ((findDisplay 1501) displayCtrl (14));
	_id =  lbCurSel 14;
	_classWeap = lbData [14, _id];
	_xp = player_stats select 0;
	_rankInfo = _xp call getRankInfo;
	_plrRank = _rankInfo select 0;
	_count =  count (missionConfigFile >> "AFCcfgMain" >> "AFC_cfg_Traders" >> "Attachments");
	for "_x" from 0 to (_count-1) do
	{
		_attachment = ((missionConfigFile >> "AFCcfgMain" >> "AFC_cfg_Traders" >> "Attachments") select _x);
		if (isClass _attachment) then
		{
			_classAttach = configName _attachment;
			_type = getNumber(configFile >> "CfgWeapons" >> _classAttach >> "ItemInfo" >> "type");
				switch (_type) do
				{				
					case 201: {_slot = "CowsSlot"; _attachCtrl = _opticCtrl;}; 
					case 101: {_slot = "MuzzleSlot"; _attachCtrl = _muzzleCtrl;}; 
					case 301: {_slot = "PointerSlot"; _attachCtrl = _pointerCtrl;}; 
					case 302: {_slot = "UnderBarrelSlot"; _attachCtrl = _bipodCtrl;}; 		
				};
			_attachCbo = ((findDisplay 1501) displayCtrl (_attachCtrl));
			_compatibleArray = getArray(configFile >> "CfgWeapons" >> _classWeap >> "WeaponSlotsInfo" >> _slot >> "compatibleItems");			
			if (_classAttach in _compatibleArray) then
			{
				_attachRank = getNumber(missionConfigFile >> "AFCcfgMain" >> "AFC_cfg_Traders" >> "Attachments" >> _classAttach >> "rank");
				_index = _attachCbo lbAdd(getText(configFile >> "cfgWeapons" >> _classAttach >> "displayName"));
				_attachCbo lbSetData[(lbSize _attachCbo)-1,  _classAttach];
				_attachCbo lbSetValue[(lbSize _attachCbo)-1,  _attachRank];
				if (_attachRank < _plrRank + 1) then
				{
					_picture = (getText(configFile >> "cfgWeapons" >> _classAttach >> "picture"));
					_attachCbo lbSetPicture[(lbSize _attachCbo)-1,_picture];
				} else
				{
					_picture = "\A3\ui_f\data\map\mapcontrol\taskIconFailed_ca.paa";
					_attachCbo lbSetPicture[(lbSize _attachCbo)-1,_picture];
				};	
			};
		};
	};
};
AFC_fnc_WeightInfo = 
{
	_uni = uniform player;
	_vest = vest player;
	_weightBarCbo = ((findDisplay 1501) displayCtrl (27));
	_maxWeight = getNumber(configFile >> "cfgVehicles" >> (backpack player)>> "maximumLoad");
	_container = [_uni,_vest];
	{
		_uniWeight = getText(configFile >> "cfgWeapons" >> _x>> "ItemInfo" >> "containerClass");
		_weight = toArray _uniWeight;
		_count = count _weight;
		_numtotal = "";	
	for "_i" from 6 to (_count-1) do
	{
		_num = _weight select _i;
		_str = toString [_num];
		_numtotal = _numtotal + _str;
	};
	_number = parseNumber _numtotal;
	_maxWeight = _maxWeight + _number;	
	}forEach [_uni,_vest];
	_plrLoad = (loadUniform player) + (loadVest player) + (loadBackpack player);
	_loadFull = _plrLoad * 100;
	if (_loadFull > 0) then 
	{
		_barPercent = _loadFull / _maxWeight;
		_weightBarCbo progressSetPosition _barPercent;
	} else 
	{_weightBarCbo progressSetPosition 0;};
};
AFC_fnc_PlayerInfo =
{
	private ["_flag"];
	disableSerialization;
	_title = "AFC King Of The Hill";
	_plrTextCbo = ((findDisplay 1501) displayCtrl (4));
	_lvlTextCbo = ((findDisplay 1501) displayCtrl (6));
	_xpBarCbo = ((findDisplay 1501) displayCtrl (7));
	_xp = player_stats select 0;
	_rankInfo = _xp call getRankInfo;
	_plrRank = _rankInfo select 0;
	_xpLimit = _rankInfo select 1;
	_nextRank = _plrRank + 1;
	_xpPercent = _xp / _xpLimit ;
	_xpBarCbo progressSetPosition _xpPercent;
	_plrClass = typeOf player;
	_plrName = profileName;
	_side = getNumber(configFile >> "cfgVehicles" >> _plrClass>> "side");
	_flagCbo = ((findDisplay 1501) displayCtrl (3));
	switch (_side) do
	{				
		case 0: {_flag = "\A3\Data_F\Flags\Flag_CSAT_CO.paa";}; 
		case 1: {_flag = "\A3\Data_F\Flags\Flag_nato_CO.paa";}; 
		case 2: {_flag = "\A3\Data_F\Flags\Flag_AAF_CO.paa";}; 	
	};
	_flagCbo ctrlSetText _flag;
	_plrTextCbo ctrlSetStructuredText parseText format ["<t align='left'>%1</t> <t align='right'>%2</t>",_plrName, _title];
	_lvlTextCbo ctrlSetStructuredText parseText format ["<t align='left'>%1</t> <t align='right'>%2</t>",_plrRank, _nextRank];
	call AFC_fnc_WeightInfo;
};
AFC_fnc_CurrentWeap = 
{
	private ["_weap"];
	disableSerialization;
	_type = _this select 0;
	_currentWeapCbo = ((findDisplay 1501) displayCtrl (18));
	switch (_type) do
	{				
		case 1: {_weap = primaryWeapon player;}; 
		case 2: {_weap = handgunWeapon player;}; 
		case 4: {_weap = secondaryWeapon player;}; 	
	};
	_weapName = getText(configFile >> "cfgWeapons" >> _weap >> "displayName");
	if (_weapName == "") then
	{
		_weapName = "None";
	};
	_currentWeapCbo ctrlSetStructuredText parseText format ["<t align='left'>Current</t> <t align='right'>%1</t>",_weapName];	
};
AFC_fnc_CurrentCloth = 
{
	private ["_cloth"];
	disableSerialization;
	_grp = _this select 0;
	_currentClothCbo = ((findDisplay 1501) displayCtrl (40));
	_id =  lbCurSel 39;
	_class = lbData [39, _id];
	_clothRank = lbValue [39, _id];
	switch (_grp) do
	{				
		case 0: {_cloth = uniform player; }; 
		case 1: {_cloth = vest player;}; 
		case 2: {_cloth = backpack player;}; 
		case 3: {_cloth = headgear player;};		
		case 4: {_cloth = goggles player;};
		case 5: {_cloth = face player;};
	};
	 if (gettext (configFile >>"cfgVehicles" >>_cloth >> "vehicleClass") == "Backpacks") then  
	{	
		_clothName = getText(configFile >> "cfgVehicles" >> _cloth >> "displayName");
		_currentClothCbo ctrlSetStructuredText parseText format ["<t align='left'>Current</t> <t align='right'>%1</t>",_clothName];		
	} else
	{	 
		if (isClass (configFile >> "cfgGlasses" >>  _cloth)) then 
	{
		_clothName = getText(configFile >> "cfgGlasses" >> _cloth >> "displayName");
		
		_currentClothCbo ctrlSetStructuredText parseText format ["<t align='left'>Current</t> <t align='right'>%1</t>",_clothName];
	} else
	{ 
		if (isClass (configFile >> "CfgFaces" >> "Man_A3" >> _cloth)) then
	{
	 _clothName = getText(configFile >> "CfgFaces" >> "Man_A3" >> _cloth >> "displayName");
	 _currentClothCbo ctrlSetStructuredText parseText format ["<t align='left'>Current</t> <t align='right'>%1</t>",_clothName];
	} else
	{	 
	 if (isClass (configFile >> "CfgWeapons" >> _cloth)) then
		{	
			_clothName = getText(configFile >> "cfgWeapons" >> _cloth >> "displayName");
			_currentClothCbo ctrlSetStructuredText parseText format ["<t align='left'>Current</t> <t align='right'>%1</t>",_clothName];
		};};};};
	if (_cloth == "") then
	{
		_clothName = "None";
		_currentClothCbo ctrlSetStructuredText parseText format ["<t align='left'>Current</t> <t align='right'>%1</t>",_clothName];
	};		
};
AFC_fnc_AddClothing = 
{
	_id =  lbCurSel 39;
	_class = lbData [39, _id];
	_clothRank = lbValue [39, _id];
	_xp = player_stats select 0;
	_rankInfo = _xp call getRankInfo;
	_plrRank = _rankInfo select 0;
	_currentClothCbo = ((findDisplay 1501) displayCtrl (40));
	if (_clothRank < _plrRank + 1) then
	{
		 if (gettext (configFile >>"cfgVehicles" >>_class >> "vehicleClass") == "Backpacks") then  
		 {
			_clothName = getText(configFile >> "cfgVehicles" >> _class >> "displayName");
			_currentClothCbo ctrlSetStructuredText parseText format ["<t align='left'>Current</t> <t align='right'>%1</t>",_clothName];
			removeBackpack player;
			player addBackpack _class;
			call AFC_fnc_WeightInfo;
		 } else
		 {	
		 for _class do {
		 if (isClass (configFile >> "cfgGlasses" >>  _class)) then 
		 {
		 _clothName = getText(configFile >> "cfgGlasses" >> _class >> "displayName");
		_currentClothCbo ctrlSetStructuredText parseText format ["<t align='left'>Current</t> <t align='right'>%1</t>",_clothName];
		 player addGoggles _class;
		 };
		 if (isClass (configFile >> "CfgFaces" >> "Man_A3" >> _class)) then
		 {
		 _clothName = getText(configFile >> "CfgFaces" >> "Man_A3" >> _class >> "displayName");
		_currentClothCbo ctrlSetStructuredText parseText format ["<t align='left'>Current</t> <t align='right'>%1</t>",_clothName];
		 player setFace _class;
		 };
		 if (isClass (configFile >> "CfgWeapons" >> _class)) then
			{
				_clothName = getText(configFile >> "cfgWeapons" >> _class >> "displayName");
				_currentClothCbo ctrlSetStructuredText parseText format ["<t align='left'>Current</t> <t align='right'>%1</t>",_clothName];
				_infoType = (getnumber (configFile>>"cfgWeapons" >> _class >> "ItemInfo" >> "Type"));		
				switch (_infoType) do
				{
					case 605: {player addHeadgear _class;}; 
					case 801: {removeUniform player;player addUniform _class;}; 
					case 701: {player addVest _class;}; 
				}; 
					call AFC_fnc_WeightInfo;
		};	};	}; 
	} else
	{
	_currentClothCbo ctrlSetStructuredText parseText format ["<t align='left'>Current</t> <t align='right'>Unlocks at Lvl: %1</t>",_clothRank];
	};
};
AFC_fnc_ItemCheckBox =
{
	private ["_item"];
	_array = _this select 0;
	_entry = _array select 1;
	_state = _array select 2;
	_xp = player_stats select 0;
	_rankInfo = _xp call getRankInfo;
	_plrRank = _rankInfo select 0;
	_itemTextCbo = ((findDisplay 1501) displayCtrl (45));
	_checkBoxCbo = ((findDisplay 1501) displayCtrl (33));
	switch (_entry) do
	{
		case 0: {_item = "ItemMap"};
		case 1: {_item = "ItemCompass"};
		case 2: {_item = "ItemGPS"};
		case 3: {_item = "NVGoggles"};
		case 4: {_item = "ItemRadio"};
		case 5: {_item = "ItemWatch"};
		case 6: {_item = "Binocular"};
		case 7: {_item = "Rangefinder"};
		case 8: {
					_uavs = ["O_UavTerminal","B_UavTerminal","I_UavTerminal"];
					_plrClass = typeOf player;
					_side = getNumber(configFile >> "cfgVehicles" >> _plrClass>> "side");
					_item = _uavs select _side;
				};
	};
	_itemRank  = getNumber(missionConfigFile >> "AFCcfgMain" >> "AFC_cfg_Traders" >> "AssignedItems" >> _item >> "rank");
	_itemName = getText(configFile >> "cfgWeapons" >> _item >> "displayName");
	if (_itemRank < _plrRank + 1) then
	{
		if (_state == 1) then 
		{
			_itemTextCbo ctrlSetStructuredText parseText format ["<t align='center'>%1 added</t>",_itemName];
			player linkItem _item;
			if!(_item in (assignedItems player)) then {
				player addWeapon _item;
			};
		}else
		{
			 _itemTextCbo ctrlSetStructuredText parseText format ["<t align='center'>%1 removed</t>",_itemName];
			player unlinkItem _item;
			if(_item in (assignedItems player)) then {
				player removeWeapon _item;
			};
		};
	} else
	{
		_itemTextCbo ctrlSetStructuredText parseText format ["<t align='center'>Unlocks at Lvl: %1</t>",_itemRank];
	};
};
AFC_fnc_LoadUniform = 
{
	private ["_cfgAFC","_cfg"];
	_clothCbo = ((findDisplay 1501) displayCtrl (39));
	_btn = _this select 0;
	lbCLear _clothCbo;
	_xp = player_stats select 0;
	_rankInfo = _xp call getRankInfo;
	_plrRank = _rankInfo select 0;
	switch (_btn) do
	{
		case 0: {_cfgAFC = "Uniforms";_cfg = "cfgWeapons";};
		case 1: {_cfgAFC = "Vests";_cfg = "cfgWeapons";};
		case 2: {_cfgAFC = "Backpacks";_cfg = "cfgVehicles";};
		case 3: {_cfgAFC = "Headgear";_cfg = "cfgWeapons";};
		case 4: {_cfgAFC = "Glasses";_cfg = "cfgGlasses";};
	};
	_count =  count (missionConfigFile >> "AFCcfgMain" >> "AFC_cfg_Traders" >> _cfgAFC);
	for "_x" from 0 to (_count-1) do
	{
		_cloth = ((missionConfigFile >> "AFCcfgMain" >> "AFC_cfg_Traders" >> _cfgAFC) select _x);
		_class = configName _cloth;
		_clothRank = getNumber(missionConfigFile >> "AFCcfgMain" >> "AFC_cfg_Traders" >> _cfgAFC>> _class >> "rank");
		if (_btn == 0) then
		{			
			_allowed = player isUniformAllowed _class;					
			if (_allowed) then 
			{
				_index = _clothCbo lbAdd(getText(configFile >> _cfg >> _class >> "displayName"));
				_clothCbo lbSetData[(lbSize _clothCbo)-1,  _class];			
				_clothCbo lbSetValue[(lbSize _clothCbo)-1,  _clothRank];	
				if (_clothRank < _plrRank + 1) then
				{
					_picture = (getText(configFile >> _cfg >> _class >> "picture"));
					_clothCbo lbSetPicture[(lbSize _clothCbo)-1,_picture];
				} else
				{
					_picture = "\A3\ui_f\data\map\mapcontrol\taskIconFailed_ca.paa";
					_clothCbo lbSetPicture[(lbSize _clothCbo)-1,_picture];
				};
			};
		} else
		{
			_index = _clothCbo lbAdd(getText(configFile >> _cfg >> _class >> "displayName"));
			_clothCbo lbSetData[(lbSize _clothCbo)-1,  _class];			
			_clothCbo lbSetValue[(lbSize _clothCbo)-1,  _clothRank];	
			if (_clothRank < _plrRank + 1) then
			{
				_picture = (getText(configFile >> _cfg >> _class >> "picture"));
				_clothCbo lbSetPicture[(lbSize _clothCbo)-1,_picture];
			} else
			{
				_picture = "\A3\ui_f\data\map\mapcontrol\taskIconFailed_ca.paa";
				_clothCbo lbSetPicture[(lbSize _clothCbo)-1,_picture];
			};			
		};
	};	
};
AFC_fnc_LoadFaces =
{
	_clothCbo = ((findDisplay 1501) displayCtrl (39));
	lbCLear _clothCbo;
	_xp = player_stats select 0;
	_rankInfo = _xp call getRankInfo;
	_plrRank = _rankInfo select 0;
	_count =  count (missionConfigFile >> "AFCcfgMain" >> "AFC_cfg_Traders" >> "Faces");
	for "_x" from 0 to (_count-1) do
	{
		_face = ((missionConfigFile >> "AFCcfgMain" >> "AFC_cfg_Traders" >> "Faces") select _x);
		_class = configName _face;
		_faceRank = getNumber(missionConfigFile >> "AFCcfgMain" >> "AFC_cfg_Traders" >> "Faces" >> _class >> "rank");
		_index = _clothCbo lbAdd(getText(configFile >> "cfgFaces" >> "Man_A3">> _class >> "displayName"));	
		
		_clothCbo lbSetData[(lbSize _clothCbo)-1,  _class];			
		_clothCbo lbSetValue[(lbSize _clothCbo)-1,  _faceRank];	
		if (_faceRank < _plrRank + 1) then
		{
			//_picture = (getText(configFile >> "cfgFaces">> "Man_A3">> _class >> "textureHL2"));
			//_clothCbo lbSetPicture[(lbSize _clothCbo)-1,_picture];
		} else
		{
			_picture = "\A3\ui_f\data\map\mapcontrol\taskIconFailed_ca.paa";
			_clothCbo lbSetPicture[(lbSize _clothCbo)-1,_picture];
		};
	};
};
AFC_fnc_LoadItems = 
{
	private ["_cfgAFC","_cfg"];
	_itemCbo = ((findDisplay 1501) displayCtrl (41));
	_btn = _this select 0;
	lbCLear _itemCbo;
	_xp = player_stats select 0;
	_rankInfo = _xp call getRankInfo;
	_plrRank = _rankInfo select 0;
	switch (_btn) do
	{
		case 0: {_cfgAFC = "SupportItems";_cfg = "cfgWeapons";};
		case 1: {_cfgAFC = "ExplosiveItems";_cfg = "cfgMagazines";};
		case 2: {_cfgAFC = "FlareItems";_cfg = "cfgMagazines";};
	};
		_count =  count (missionConfigFile >> "AFCcfgMain" >> "AFC_cfg_Traders" >> _cfgAfc);
	for "_x" from 0 to (_count-1) do
	{
		_item = ((missionConfigFile >> "AFCcfgMain" >> "AFC_cfg_Traders" >> _cfgAfc) select _x);
		_class = configName _item;
		_itemRank = getNumber(missionConfigFile >> "AFCcfgMain" >> "AFC_cfg_Traders" >> _cfgAfc >> _class >> "rank");
		_index = _itemCbo lbAdd(getText(configFile >> _cfg >> _class >> "displayName"));	
		
		_itemCbo lbSetData[(lbSize _itemCbo)-1,  _class];			
		_itemCbo lbSetValue[(lbSize _itemCbo)-1,  _itemRank];	
		if (_itemRank < _plrRank + 1) then
		{
			_picture = (getText(configFile >> _cfg >> _class >> "picture"));
			_itemCbo lbSetPicture[(lbSize _itemCbo)-1,_picture];
		} else
		{
			_picture = "\A3\ui_f\data\map\mapcontrol\taskIconFailed_ca.paa";
			_itemCbo lbSetPicture[(lbSize _itemCbo)-1,_picture];
		};
	};
};
AFC_fnc_LoadLoadouts = 
{
	private ["_count"];
	_loadouts = ["Loadout One","Loadout Two","Loadout Three","Loadout Four *","Loadout Five **","Loadout Six ***"];
	_donator = player_info select 1;
	if ((player_info select 0)>0) then
	{_count = 6} else
	{
		switch (_donator) do
		{
			case 0: {_count = 3};
			case 1: {_count = 4};
			case 2: {_count = 5};
			case 3: {_count = 6};
		};
	};
	for "_x" from 0 to (_count-1) do
	{
		_loadout = _loadouts select _x;
		_loadoutCbo = ((findDisplay 1501) displayCtrl (46));
		_loadoutCbo lbadd _loadout;
	};
};
AFC_fnc_LoadnSave =
{
	_save = _this select 0;
	_id =  lbCurSel 46;
	_loadoutNum = _id + 1;
	if (_save == 0) then
	{
		if(!player_loadoutcooldown) then
		{
			player_loadoutcooldown = true;
			hint "Your loadout was saved on the server.";
			[_loadoutNum] call KOTH_fnc_player_setGear;
			_nil = [30] execVM "other_functions\lcool.sqf";
			//sleep 30;
			player_loadoutcooldown = false;
		} else {hint format ["Your loadout cooldown is active. Please wait another %1 seconds!",lcdleft];};		
	}else
	{
		if(!player_loadoutcooldown) then
		{
			player_loadoutcooldown = true;
			hint "Your loadout will load now. Please wait!";
			[_loadoutNum] call KOTH_fnc_player_getGear;
			_nil = [30] execVM "other_functions\lcool.sqf";
			//sleep 30;
			player_loadoutcooldown = false;
		} else {hint format ["Your loadout cooldown is active. Please wait another %1 seconds!",lcdleft];};		
	};	
};