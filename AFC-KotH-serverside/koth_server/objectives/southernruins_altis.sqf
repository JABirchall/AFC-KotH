// Created by SMC v2.1.3 (for Arma 3)
// 07/22/16 13:47:45

// --Markers--
createMarker ["respawn_west",[13757.887,6381.8237,60.61549]];
	"respawn_west" setMarkerShape "ICON";
	"respawn_west" setMarkerType "Empty";
	"respawn_west" setMarkerDir 0.13357118;
	publicVariable "respawn_west";
createMarker ["respawn_east",[10555.539,12165.149,14.781993]];
	"respawn_east" setMarkerShape "ICON";
	"respawn_east" setMarkerType "Empty";
	"respawn_east" setMarkerDir 120;
	publicVariable "respawn_east";
createMarker ["respawn_guerrila",[8380.7871,7365.9624,19.448532]];
	"respawn_guerrila" setMarkerShape "ICON";
	"respawn_guerrila" setMarkerType "Empty";
	"respawn_guerrila" setMarkerDir 45;
	publicVariable "respawn_guerrila";
createMarker ["vspawn_blu",[13776.184,6379.106,60.396236]];
	"vspawn_blu" setMarkerShape "ICON";
	"vspawn_blu" setMarkerType "Empty";
	"vspawn_blu" setMarkerDir 270;
	publicVariable "vspawn_blu";
createMarker ["vspawn_ind",[8464.9971,7366.1348,5.3386574]];
	"vspawn_ind" setMarkerShape "ICON";
	"vspawn_ind" setMarkerType "Empty";
	"vspawn_ind" setMarkerDir 90;
	publicVariable "vspawn_ind";
createMarker ["vspawn_red",[10556.032,12136.308,15.000113]];
	"vspawn_red" setMarkerShape "ICON";
	"vspawn_red" setMarkerType "Empty";
	"vspawn_red" setMarkerDir -74.482483;
	publicVariable "vspawn_red";
createMarker ["BLUFOR_BASE",[13755.695,6387.2046,60.607452]];
	"BLUFOR_BASE" setMarkerShape "ICON";
	"BLUFOR_BASE" setMarkerType "mil_flag";
	"BLUFOR_BASE" setMarkerDir 0.13357118;
	"BLUFOR_BASE" setMarkerColor "ColorWEST";
	"BLUFOR_BASE" setMarkerText "BLUFOR BASE";
	publicVariable "BLUFOR_BASE";
createMarker ["INDEPENDENT_BASE",[8349.8486,7364.6621,19.282057]];
	"INDEPENDENT_BASE" setMarkerShape "ICON";
	"INDEPENDENT_BASE" setMarkerType "mil_flag";
	"INDEPENDENT_BASE" setMarkerDir 0.13357118;
	"INDEPENDENT_BASE" setMarkerColor "ColorGUER";
	"INDEPENDENT_BASE" setMarkerText "INDEPENDENT BASE";
	publicVariable "INDEPENDENT_BASE";
createMarker ["OPFOR_BASE",[10561.737,12162.46,14.87695]];
	"OPFOR_BASE" setMarkerShape "ICON";
	"OPFOR_BASE" setMarkerType "mil_flag";
	"OPFOR_BASE" setMarkerDir 2.5939913;
	"OPFOR_BASE" setMarkerColor "ColorEAST";
	"OPFOR_BASE" setMarkerText "OPFOR BASE";
	publicVariable "OPFOR_BASE";
createMarker ["respawn_vehicle_guerrila",[8423.9629,7365.0449,10.021297]];
	"respawn_vehicle_guerrila" setMarkerShape "ICON";
	"respawn_vehicle_guerrila" setMarkerType "Empty";
	"respawn_vehicle_guerrila" setMarkerDir 90.106682;
	publicVariable "respawn_vehicle_guerrila";
createMarker ["respawn_vehicle_east",[10545.224,12150.531,14.866115]];
	"respawn_vehicle_east" setMarkerShape "ICON";
	"respawn_vehicle_east" setMarkerType "Empty";
	"respawn_vehicle_east" setMarkerDir 230;
	publicVariable "respawn_vehicle_east";
createMarker ["objective_main",[11206.354,8718.4287,182.41]];
	"objective_main" setMarkerShape "ICON";
	"objective_main" setMarkerType "Empty";
	"objective_main" setMarkerDir 0.13357118;
	publicVariable "objective_main";
createMarker ["respawn_vehicle_west",[13712.978,6391.3984,60.322681]];
	"respawn_vehicle_west" setMarkerShape "ICON";
	"respawn_vehicle_west" setMarkerType "Empty";
	"respawn_vehicle_west" setMarkerDir -71.724503;
	publicVariable "respawn_vehicle_west";
	
locationmarkers = "done";
publicVariable "locationmarkers";

// --Vehicles/Objects--
cargobox_blu = createVehicle ["Land_CargoBox_V1_F",[13742.666,6386.834,0],[],0,"CAN_COLLIDE"];
	cargobox_blu setVehicleVarName "cargobox_blu";
		cargobox_blu setFormDir 0.13357118;
		cargobox_blu setDir 0.13357118;
	cargobox_blu enableSimulation false;
	publicVariable "cargobox_blu";
flagpole_blu = createVehicle ["Flag_Blue_F",[13748.006,6385.7993,0],[],0,"CAN_COLLIDE"];
	flagpole_blu setVehicleVarName "flagpole_blu";
		flagpole_blu setFormDir 0.13357118;
		flagpole_blu setDir 0.13357118;
		publicVariable "flagpole_blu";
trader_cars_blu = createVehicle ["Land_CashDesk_F",[13773.522,6391.6157,0],[],0,"CAN_COLLIDE"];
	trader_cars_blu setVehicleVarName "trader_cars_blu";
		trader_cars_blu setFormDir 359.87448;
		trader_cars_blu setDir 359.87448;
	trader_cars_blu enableSimulation false;
	publicVariable "trader_cars_blu";
trader_weapons_blu = createVehicle ["Land_CashDesk_F",[13740.614,6394.1597,0],[],0,"CAN_COLLIDE"];
	trader_weapons_blu setVehicleVarName "trader_weapons_blu";
		trader_weapons_blu setFormDir 0.31729;
		trader_weapons_blu setDir 0.31729;
	trader_weapons_blu enableSimulation false;
	publicVariable "trader_weapons_blu";
cargobox_ind = createVehicle ["Land_CargoBox_V1_F",[8416.793,7377.6641,0],[],0,"CAN_COLLIDE"];
	cargobox_ind setVehicleVarName "cargobox_ind";
		cargobox_ind setFormDir 0.13357118;
		cargobox_ind setDir 0.13357118;
	cargobox_ind enableSimulation false;
	publicVariable "cargobox_ind";
flagpole_ind = createVehicle ["Flag_Green_F",[8416.7246,7370.9478,0],[],0,"CAN_COLLIDE"];
	flagpole_ind setVehicleVarName "flagpole_ind";
		flagpole_ind setFormDir 0.13357118;
		flagpole_ind setDir 0.13357118;
		publicVariable "flagpole_ind";
trader_cars_ind = createVehicle ["Land_CashDesk_F",[8455.666,7365.9473,0],[],0,"CAN_COLLIDE"];
	trader_cars_ind setVehicleVarName "trader_cars_ind";
		trader_cars_ind setFormDir 88.55783;
		trader_cars_ind setDir 88.55783;
	trader_cars_ind enableSimulation false;
	publicVariable "trader_cars_ind";
trader_weapons_ind = createVehicle ["Land_CashDesk_F",[8396.3037,7375.3843,0],[],0,"CAN_COLLIDE"];
	trader_weapons_ind setVehicleVarName "trader_weapons_ind";
		trader_weapons_ind setFormDir 357.57462;
		trader_weapons_ind setDir 357.57462;
	trader_weapons_ind enableSimulation false;
	publicVariable "trader_weapons_ind";
cargobox_red = createVehicle ["Land_CargoBox_V1_F",[10560.316,12164.413,0],[],0,"CAN_COLLIDE"];
	cargobox_red setVehicleVarName "cargobox_red";
		cargobox_red setFormDir 46.138504;
		cargobox_red setDir 46.138504;
	cargobox_red enableSimulation false;
	publicVariable "cargobox_red";
flagpole_red = createVehicle ["Flag_Red_F",[10556.135,12159.177,0],[],0,"CAN_COLLIDE"];
	flagpole_red setVehicleVarName "flagpole_red";
		flagpole_red setFormDir 285.517517;
		flagpole_red setDir 285.517517;
		publicVariable "flagpole_red";
trader_cars_red = createVehicle ["Land_CashDesk_F",[10562.905,12143.079,0],[],0,"CAN_COLLIDE"];
	trader_cars_red setVehicleVarName "trader_cars_red";
		trader_cars_red setFormDir 139.89972;
		trader_cars_red setDir 139.89972;
	trader_cars_red enableSimulation false;
	publicVariable "trader_cars_red";
trader_weapons_red = createVehicle ["Land_CashDesk_F",[10571.062,12158.648,0],[],0,"CAN_COLLIDE"];
	trader_weapons_red setVehicleVarName "trader_weapons_red";
		trader_weapons_red setFormDir 141.91272;
		trader_weapons_red setDir 141.91272;
	trader_weapons_red enableSimulation false;
	publicVariable "trader_weapons_red";
_veh12 = createVehicle ["CamoNet_BLUFOR_F",[11206.61,8718.8809,0],[],0,"CAN_COLLIDE"];
		_veh12 setFormDir 30.133574;
		_veh12 setDir 30.133574;
_veh13 = createVehicle ["Land_Pallet_MilBoxes_F",[11203.88,8719.4697,0],[],0,"CAN_COLLIDE"];
		_veh13 setFormDir 30.133574;
		_veh13 setDir 30.133574;
_veh14 = createVehicle ["Land_Pallet_MilBoxes_F",[11208.331,8716.6221,0],[],0,"CAN_COLLIDE"];
		_veh14 setFormDir 30.133574;
		_veh14 setDir 30.133574;
_veh15 = createVehicle ["Land_ScrapHeap_1_F",[11211.56,8711.8574,0],[],0,"CAN_COLLIDE"];
		_veh15 setFormDir 30.133574;
		_veh15 setDir 30.133574;
_veh16 = createVehicle ["Land_PaperBox_closed_F",[11205.684,8711.4619,0],[],0,"CAN_COLLIDE"];
		_veh16 setFormDir 30.133574;
		_veh16 setDir 30.133574;
_veh17 = createVehicle ["Flag_Green_F",[11196.278,8717.4648,0],[],0,"CAN_COLLIDE"];
		_veh17 setFormDir 30.133574;
		_veh17 setDir 30.133574;
_veh18 = createVehicle ["Flag_Blue_F",[11198.192,8713.4033,0],[],0,"CAN_COLLIDE"];
		_veh18 setFormDir 30.133574;
		_veh18 setDir 30.133574;
_veh19 = createVehicle ["Flag_Red_F",[11195.578,8721.8174,0],[],0,"CAN_COLLIDE"];
		_veh19 setFormDir 30.133574;
		_veh19 setDir 30.133574;
_veh20 = createVehicle ["Land_Billboard_F",[11198.501,8727.2285,0],[],0,"CAN_COLLIDE"];
		_veh20 setFormDir 2.0511613;
		_veh20 setDir 2.0511613;
	_veh20 setVectorUp [0, 0, 1]; _veh20 setObjectTextureGlobal [0, "images\koth_afc.jpg"]; _veh20 allowDamage false; _veh20 enableSimulation false;
_veh21 = createVehicle ["Land_Billboard_F",[11198.535,8728.4678,0],[],0,"CAN_COLLIDE"];
		_veh21 setFormDir 182.00357;
		_veh21 setDir 182.00357;
	_veh21 setVectorUp [0, 0, 1]; _veh21 setObjectTextureGlobal [0, "images\koth_afc.jpg"]; _veh21 allowDamage false; _veh21 enableSimulation false;
_veh22 = createVehicle ["Land_City_8m_F",[10587.156,12174.742,0],[],0,"CAN_COLLIDE"];
		_veh22 setFormDir 51.923801;
		_veh22 setDir 51.923801;
	_veh22 allowDamage false; _veh22 enableSimulation false;
_veh23 = createVehicle ["Land_City_8m_F",[10583.079,12180.021,0],[],0,"CAN_COLLIDE"];
		_veh23 setFormDir 51.923801;
		_veh23 setDir 51.923801;
	_veh23 allowDamage false; _veh23 enableSimulation false;
_veh24 = createVehicle ["Land_City_8m_F",[10579.073,12185.206,0],[],0,"CAN_COLLIDE"];
		_veh24 setFormDir 51.923801;
		_veh24 setDir 51.923801;
	_veh24 allowDamage false; _veh24 enableSimulation false;
_veh25 = createVehicle ["Land_Cargo_Tower_V1_No2_F",[10328.08,8715.3066,0],[],0,"CAN_COLLIDE"];
_veh26 = createVehicle ["Land_Cargo_Tower_V1_No3_F",[10712.216,7614.0928,0],[],0,"CAN_COLLIDE"];
_veh27 = createVehicle ["Land_Cargo_Tower_V1_No4_F",[11924.956,7593.2607,0],[],0,"CAN_COLLIDE"];
_veh28 = createVehicle ["Land_Cargo_Tower_V1_No5_F",[12286.606,8923.0605,0],[],0,"CAN_COLLIDE"];
_veh29 = createVehicle ["Land_Cargo_Tower_V1_No6_F",[10820.904,9913.9248,0],[],0,"CAN_COLLIDE"];
_veh30 = createVehicle ["Land_Cargo_Tower_V1_No1_F",[11217.296,8638.1191,0],[],0,"CAN_COLLIDE"];
_veh31 = createVehicle ["Land_Cargo_Tower_V1_No7_F",[9169.8135,8428.0654,0],[],0,"CAN_COLLIDE"];
_veh32 = createVehicle ["B_MRAP_01_F",[8442.4365,7360.7788,0],[],0,"CAN_COLLIDE"];
		_veh32 setFormDir 88.707397;
		_veh32 setDir 88.707397;
		_veh32 enableRopeAttach false;
	_veh32 setVehicleLock "UNLOCKED";
	_veh32 respawnVehicle [300]; clearWeaponCargoGlobal _veh32;  clearMagazineCargoGlobal _veh32;  clearItemCargoGlobal _veh32;
_veh33 = createVehicle ["B_MRAP_01_F",[8442.0498,7369.3784,0],[],0,"CAN_COLLIDE"];
		_veh33 setFormDir 86.467598;
		_veh33 setDir 86.467598;
		_veh33 enableRopeAttach false;
	_veh33 setVehicleLock "UNLOCKED";
	_veh33 respawnVehicle [300]; clearWeaponCargoGlobal _veh33;  clearMagazineCargoGlobal _veh33;  clearItemCargoGlobal _veh33;
_veh34 = createVehicle ["B_MRAP_01_F",[13732.942,6389.7871,0],[],0,"CAN_COLLIDE"];
		_veh34 setFormDir 287.071999;
		_veh34 setDir 287.071999;
		_veh34 enableRopeAttach false;
	_veh34 setVehicleLock "UNLOCKED";
	_veh34 respawnVehicle [300]; clearWeaponCargoGlobal _veh34;  clearMagazineCargoGlobal _veh34;  clearItemCargoGlobal _veh34;
_veh35 = createVehicle ["B_MRAP_01_F",[13730.599,6381.501,0],[],0,"CAN_COLLIDE"];
		_veh35 setFormDir 284.832199;
		_veh35 setDir 284.832199;
		_veh35 enableRopeAttach false;
	_veh35 setVehicleLock "UNLOCKED";
	_veh35 respawnVehicle [300]; clearWeaponCargoGlobal _veh35;  clearMagazineCargoGlobal _veh35;  clearItemCargoGlobal _veh35;
_veh36 = createVehicle ["B_MRAP_01_F",[10569.326,12164.013,0],[],0,"CAN_COLLIDE"];
		_veh36 setFormDir 230.321;
		_veh36 setDir 230.321;
		_veh36 enableRopeAttach false;
	_veh36 setVehicleLock "UNLOCKED";
	_veh36 respawnVehicle [300]; clearWeaponCargoGlobal _veh36;  clearMagazineCargoGlobal _veh36;  clearItemCargoGlobal _veh36;
_veh37 = createVehicle ["B_MRAP_01_F",[10560.385,12156.475,0],[],0,"CAN_COLLIDE"];
		_veh37 setFormDir 229.675;
		_veh37 setDir 229.675;
		_veh37 enableRopeAttach false;
	_veh37 setVehicleLock "UNLOCKED";
	_veh37 respawnVehicle [300]; clearWeaponCargoGlobal _veh37;  clearMagazineCargoGlobal _veh37;  clearItemCargoGlobal _veh37;
// --Units--
_group0 = createGroup civilian;
	_unit0 = _group0 createUnit ["C_man_1",[13740.602,6395.4556,0],[],0,"FORM"];
		if (isNull _unit0) then {
			_unit0 = createVehicle ["C_man_1",[13740.602,6395.4556,0],[],0,"FORM"];
 			createVehicleCrew _unit0;
		};
		(group _unit0) selectLeader _unit0;
		_unit0 setFormDir 179.13358;
		_unit0 setDir 179.13358;
		_unit0 enableSimulation false; _unit0 disableAI "MOVE"; _unit0 disableAI "ANIM"; _unit0 allowDamage false;
_group1 = createGroup civilian;
	_unit1 = _group1 createUnit ["C_man_1",[13773.572,6393.2456,0],[],0,"FORM"];
		if (isNull _unit1) then {
			_unit1 = createVehicle ["C_man_1",[13773.572,6393.2456,0],[],0,"FORM"];
 			createVehicleCrew _unit1;
		};
		(group _unit1) selectLeader _unit1;
		_unit1 setFormDir 179.13383;
		_unit1 setDir 179.13383;
		_unit1 enableSimulation false; _unit1 disableAI "MOVE"; _unit1 disableAI "ANIM"; _unit1 allowDamage false;
_group2 = createGroup civilian;
	_unit2 = _group2 createUnit ["C_man_1",[8396.1377,7376.6699,0],[],0,"FORM"];
		if (isNull _unit2) then {
			_unit2 = createVehicle ["C_man_1",[8396.1377,7376.6699,0],[],0,"FORM"];
 			createVehicleCrew _unit2;
		};
		(group _unit2) selectLeader _unit2;
		_unit2 setFormDir 173.5751;
		_unit2 setDir 173.5751;
		_unit2 enableSimulation false; _unit2 disableAI "MOVE"; _unit2 disableAI "ANIM"; _unit2 allowDamage false;
_group3 = createGroup civilian;
	_unit3 = _group3 createUnit ["C_man_1",[8456.8643,7366.0483,0],[],0,"FORM"];
		if (isNull _unit3) then {
			_unit3 = createVehicle ["C_man_1",[8456.8643,7366.0483,0],[],0,"FORM"];
 			createVehicleCrew _unit3;
		};
		(group _unit3) selectLeader _unit3;
		_unit3 setFormDir 274.18448;
		_unit3 setDir 274.18448;
		_unit3 enableSimulation false; _unit3 disableAI "MOVE"; _unit3 disableAI "ANIM"; _unit3 allowDamage false;
_group4 = createGroup civilian;
	_unit4 = _group4 createUnit ["C_man_1",[10571.825,12157.482,0],[],0,"FORM"];
		if (isNull _unit4) then {
			_unit4 = createVehicle ["C_man_1",[10571.825,12157.482,0],[],0,"FORM"];
 			createVehicleCrew _unit4;
		};
		(group _unit4) selectLeader _unit4;
		_unit4 setFormDir 322.71176;
		_unit4 setDir 322.71176;
		_unit4 enableSimulation false; _unit4 disableAI "MOVE"; _unit4 disableAI "ANIM"; _unit4 allowDamage false;
_group5 = createGroup civilian;
	_unit5 = _group5 createUnit ["C_man_1",[10563.788,12142.002,0],[],0,"FORM"];
		if (isNull _unit5) then {
			_unit5 = createVehicle ["C_man_1",[10563.788,12142.002,0],[],0,"FORM"];
 			createVehicleCrew _unit5;
		};
		(group _unit5) selectLeader _unit5;
		_unit5 setFormDir 319.6763;
		_unit5 setDir 319.6763;
		_unit5 enableSimulation false; _unit5 disableAI "MOVE"; _unit5 disableAI "ANIM"; _unit5 allowDamage false;

spawnfile = "done";
publicVariable "spawnfile";