// Created by SMC v2.1.3 (for Arma 3)
// 07/30/16 23:11:41

// --Markers--
createMarker ["respawn_east",[15835.21,19748.922,22.616188]];
	"respawn_east" setMarkerShape "ICON";
	"respawn_east" setMarkerType "Empty";
	publicVariable "respawn_east";
createMarker ["respawn_west",[11714.101,18844.91,56.288574]];
	"respawn_west" setMarkerShape "ICON";
	"respawn_west" setMarkerType "Empty";
	publicVariable "respawn_west";
createMarker ["respawn_guerrila",[15730.07,17443.293,14.236065]];
	"respawn_guerrila" setMarkerShape "ICON";
	"respawn_guerrila" setMarkerType "Empty";
	publicVariable "respawn_guerrila";
createMarker ["OPFOR_BASE",[15841.573,19752.191,22.635204]];
	"OPFOR_BASE" setMarkerShape "ICON";
	"OPFOR_BASE" setMarkerType "mil_flag";
	"OPFOR_BASE" setMarkerColor "ColorEAST";
	"OPFOR_BASE" setMarkerText "OPFOR BASE";
	publicVariable "OPFOR_BASE";
createMarker ["BLUFOR_BASE",[11714.107,18847.414,56.274933]];
	"BLUFOR_BASE" setMarkerShape "ICON";
	"BLUFOR_BASE" setMarkerType "mil_flag";
	"BLUFOR_BASE" setMarkerColor "ColorWEST";
	"BLUFOR_BASE" setMarkerText "BLUFOR BASE";
	publicVariable "BLUFOR_BASE";
createMarker ["INDEPENDENT_BASE",[15750.164,17449.578,14.23053]];
	"INDEPENDENT_BASE" setMarkerShape "ICON";
	"INDEPENDENT_BASE" setMarkerType "mil_flag";
	"INDEPENDENT_BASE" setMarkerColor "ColorGUER";
	"INDEPENDENT_BASE" setMarkerText "INDEPENDENT BASE";
	publicVariable "INDEPENDENT_BASE";
createMarker ["respawn_vehicle_guerrila",[15758.359,17457.08,14.280542]];
	"respawn_vehicle_guerrila" setMarkerShape "ICON";
	"respawn_vehicle_guerrila" setMarkerType "Empty";
	"respawn_vehicle_guerrila" setMarkerDir -92.3815;
	publicVariable "respawn_vehicle_guerrila";
createMarker ["vspawn_ind",[15721.225,17432.697,14.178326]];
	"vspawn_ind" setMarkerShape "ICON";
	"vspawn_ind" setMarkerType "Empty";
	publicVariable "vspawn_ind";
createMarker ["respawn_vehicle_east",[15853.282,19756.227,23.064632]];
	"respawn_vehicle_east" setMarkerShape "ICON";
	"respawn_vehicle_east" setMarkerType "Empty";
	"respawn_vehicle_east" setMarkerDir -135.521;
	publicVariable "respawn_vehicle_east";
createMarker ["respawn_vehicle_west",[11704.799,18840.24,56.702591]];
	"respawn_vehicle_west" setMarkerShape "ICON";
	"respawn_vehicle_west" setMarkerType "Empty";
	"respawn_vehicle_west" setMarkerDir 91.662697;
	publicVariable "respawn_vehicle_west";
createMarker ["vspawn_red",[15846.527,19735.344,22.479687]];
	"vspawn_red" setMarkerShape "ICON";
	"vspawn_red" setMarkerType "Empty";
	publicVariable "vspawn_red";
createMarker ["vspawn_blu",[11726.567,18857.234,55.892941]];
	"vspawn_blu" setMarkerShape "ICON";
	"vspawn_blu" setMarkerType "Empty";
	"vspawn_blu" setMarkerDir 140.9368;
	publicVariable "vspawn_blu";
createMarker ["objective_main",[14039.286,18743.627,25.884485]];
	"objective_main" setMarkerShape "ICON";
	"objective_main" setMarkerType "Empty";
	publicVariable "objective_main";
	
locationmarkers = "done";
publicVariable "locationmarkers";

// --Vehicles/Objects--
trader_weapons_red = createVehicle ["Land_CashDesk_F",[15840.574,19751.893,0],[],0,"CAN_COLLIDE"];
	trader_weapons_red setVehicleVarName "trader_weapons_red";
	trader_weapons_red enableSimulation false;
	publicVariable "trader_weapons_red";
trader_cars_red = createVehicle ["Land_CashDesk_F",[15833.299,19751.98,0],[],0,"CAN_COLLIDE"];
	trader_cars_red setVehicleVarName "trader_cars_red";
	trader_cars_red enableSimulation false;
	publicVariable "trader_cars_red";
trader_weapons_blu = createVehicle ["Land_CashDesk_F",[11716.597,18844.881,0],[],0,"CAN_COLLIDE"];
	trader_weapons_blu setVehicleVarName "trader_weapons_blu";
	trader_weapons_blu enableSimulation false;
	publicVariable "trader_weapons_blu";
trader_weapons_ind = createVehicle ["Land_CashDesk_F",[15740.301,17446.016,0],[],0,"CAN_COLLIDE"];
	trader_weapons_ind setVehicleVarName "trader_weapons_ind";
		trader_weapons_ind setFormDir 20.021702;
		trader_weapons_ind setDir 20.021702;
	trader_weapons_ind enableSimulation false;
	publicVariable "trader_weapons_ind";
trader_cars_blu = createVehicle ["Land_CashDesk_F",[11709.447,18846.352,0],[],0,"CAN_COLLIDE"];
	trader_cars_blu setVehicleVarName "trader_cars_blu";
	trader_cars_blu enableSimulation false;
	publicVariable "trader_cars_blu";
trader_cars_ind = createVehicle ["Land_CashDesk_F",[15733.537,17448.711,0],[],0,"CAN_COLLIDE"];
	trader_cars_ind setVehicleVarName "trader_cars_ind";
		trader_cars_ind setFormDir 20.021702;
		trader_cars_ind setDir 20.021702;
	trader_cars_ind enableSimulation false;
	publicVariable "trader_cars_ind";
flagpole_red = createVehicle ["Flag_Red_F",[15830.627,19748.604,0],[],0,"CAN_COLLIDE"];
	flagpole_red setVehicleVarName "flagpole_red";
	publicVariable "flagpole_red";
flagpole_ind = createVehicle ["Flag_Green_F",[15737.065,17447.689,0],[],0,"CAN_COLLIDE"];
	flagpole_ind setVehicleVarName "flagpole_ind";
	publicVariable "flagpole_ind";
flagpole_blu = createVehicle ["Flag_Blue_F",[11712.271,18845.508,0],[],0,"CAN_COLLIDE"];
	flagpole_blu setVehicleVarName "flagpole_blu";
	publicVariable "flagpole_blu";
cargobox_blu = createVehicle ["Land_CargoBox_V1_F",[11719.742,18845.436,0],[],0,"CAN_COLLIDE"];
	cargobox_blu setVehicleVarName "cargobox_blu";
	cargobox_blu enableSimulation false;
	publicVariable "cargobox_blu";
cargobox_red = createVehicle ["Land_CargoBox_V1_F",[15837.281,19751.824,0],[],0,"CAN_COLLIDE"];
	cargobox_red setVehicleVarName "cargobox_red";
	cargobox_red enableSimulation false;
	publicVariable "cargobox_red";
cargobox_ind = createVehicle ["Land_CargoBox_V1_F",[15729.125,17449.623,0],[],0,"CAN_COLLIDE"];
	cargobox_ind setVehicleVarName "cargobox_ind";
	cargobox_ind enableSimulation false;
	publicVariable "cargobox_ind";
_veh12 = createVehicle ["Flag_Green_F",[14032.915,18745.178,0],[],0,"CAN_COLLIDE"];
		_veh12 setFormDir 30;
		_veh12 setDir 30;
_veh13 = createVehicle ["Flag_Blue_F",[14035.924,18746.076,0],[],0,"CAN_COLLIDE"];
		_veh13 setFormDir 30;
		_veh13 setDir 30;
_veh14 = createVehicle ["Flag_Red_F",[14033.341,18748.139,0],[],0,"CAN_COLLIDE"];
		_veh14 setFormDir 30;
		_veh14 setDir 30;
_veh15 = createVehicle ["Land_Billboard_F",[14051.515,18735.625,0],[],0,"CAN_COLLIDE"];
		_veh15 setFormDir 130.82635;
		_veh15 setDir 130.82635;
	_veh15 setVectorUp [0, 0, 1]; _veh15 setObjectTextureGlobal [0, "images\koth_afc.jpg"]; _veh15 allowDamage false; _veh15 enableSimulation false;
_veh16 = createVehicle ["Land_Billboard_F",[14043.211,18763.615,0],[],0,"CAN_COLLIDE"];
		_veh16 setFormDir 303.233;
		_veh16 setDir 303.233;
	_veh16 setVectorUp [0, 0, 1]; _veh16 setObjectTextureGlobal [0, "images\koth_afc.jpg"]; _veh16 allowDamage false; _veh16 enableSimulation false;
_veh17 = createVehicle ["Land_HelipadCircle_F",[15853.389,19740.195,0],[],0,"CAN_COLLIDE"];
		_veh17 setFormDir 32.4963;
		_veh17 setDir 32.4963;
_veh18 = createVehicle ["B_Heli_Light_01_F",[15853.09,19739.709,0],[],0,"NONE"];
		_veh18 setFormDir 32.4963;
		_veh18 setDir 32.4963;
	_veh18 setVehicleLock "UNLOCKED";
	_veh18 respawnVehicle [300]; clearWeaponCargoGlobal _veh18;  clearMagazineCargoGlobal _veh18;  clearItemCargoGlobal _veh18;
_veh19 = createVehicle ["Land_HelipadCircle_F",[15752.65,17424.709,0],[],0,"CAN_COLLIDE"];
		_veh19 setFormDir 32.4963;
		_veh19 setDir 32.4963;
_veh20 = createVehicle ["B_Heli_Light_01_F",[15752.352,17424.223,0],[],0,"NONE"];
		_veh20 setFormDir 32.4963;
		_veh20 setDir 32.4963;
	_veh20 setVehicleLock "UNLOCKED";
	_veh20 respawnVehicle [300]; clearWeaponCargoGlobal _veh20;  clearMagazineCargoGlobal _veh20;  clearItemCargoGlobal _veh20;
_veh21 = createVehicle ["Land_HelipadCircle_F",[11713.287,18867.086,0],[],0,"CAN_COLLIDE"];
		_veh21 setFormDir 32.4963;
		_veh21 setDir 32.4963;
_veh22 = createVehicle ["B_Heli_Light_01_F",[11712.988,18866.6,0],[],0,"NONE"];
		_veh22 setFormDir 32.4963;
		_veh22 setDir 32.4963;
	_veh22 setVehicleLock "UNLOCKED";
	_veh22 respawnVehicle [300]; clearWeaponCargoGlobal _veh22;  clearMagazineCargoGlobal _veh22;  clearItemCargoGlobal _veh22;
_veh23 = createVehicle ["Land_Cargo_Tower_V1_No1_F",[14054.863,18733.229,0],[],0,"NONE"];
		_veh23 setFormDir 309.691002;
		_veh23 setDir 309.691002;
	_veh23 setVehicleLock "UNLOCKED";
_veh24 = createVehicle ["Land_Cargo_Tower_V1_No2_F",[13899.541,18572.477,0],[],0,"NONE"];
		_veh24 setFormDir 298.432671;
		_veh24 setDir 298.432671;
	_veh24 setVehicleLock "UNLOCKED";
_veh25 = createVehicle ["Land_Cargo_Tower_V1_No3_F",[14161.23,18465.605,0],[],0,"NONE"];
		_veh25 setFormDir 140.01414;
		_veh25 setDir 140.01414;
	_veh25 setVehicleLock "UNLOCKED";
_veh26 = createVehicle ["Land_Cargo_Tower_V1_No4_F",[14447.901,18667.957,0],[],0,"NONE"];
		_veh26 setFormDir 295.419685;
		_veh26 setDir 295.419685;
	_veh26 setVehicleLock "UNLOCKED";
_veh27 = createVehicle ["Land_Cargo_Tower_V1_No5_F",[14138.975,18994.059,0],[],0,"NONE"];
		_veh27 setFormDir 271.881729;
		_veh27 setDir 271.881729;
	_veh27 setVehicleLock "UNLOCKED";
_veh28 = createVehicle ["Land_Cargo_Tower_V1_No6_F",[13625.303,18665.309,0],[],0,"NONE"];
		_veh28 setFormDir 13.96946;
		_veh28 setDir 13.96946;
	_veh28 setVehicleLock "UNLOCKED";
// --Units--
_group0 = createGroup civilian;
	_unit0 = _group0 createUnit ["C_man_p_fugitive_F",[11716.685,18845.814,0],[],0,"FORM"];
		if (isNull _unit0) then {
			_unit0 = createVehicle ["C_man_p_fugitive_F",[11716.685,18845.814,0],[],0,"FORM"];
 			createVehicleCrew _unit0;
		};
		(group _unit0) selectLeader _unit0;
		_unit0 setFormDir 181.94513;
		_unit0 setDir 181.94513;
		_unit0 enableSimulation false; _unit0 disableAI "MOVE"; _unit0 disableAI "ANIM"; _unit0 allowDamage false;
_group1 = createGroup civilian;
	_unit1 = _group1 createUnit ["C_man_p_fugitive_F",[11709.433,18847.523,0],[],0,"FORM"];
		if (isNull _unit1) then {
			_unit1 = createVehicle ["C_man_p_fugitive_F",[11709.433,18847.523,0],[],0,"FORM"];
 			createVehicleCrew _unit1;
		};
		(group _unit1) selectLeader _unit1;
		_unit1 setFormDir 181.94513;
		_unit1 setDir 181.94513;
		_unit1 enableSimulation false; _unit1 disableAI "MOVE"; _unit1 disableAI "ANIM"; _unit1 allowDamage false;
_group2 = createGroup civilian;
	_unit2 = _group2 createUnit ["C_man_p_fugitive_F",[15840.495,19752.801,0],[],0,"FORM"];
		if (isNull _unit2) then {
			_unit2 = createVehicle ["C_man_p_fugitive_F",[15840.495,19752.801,0],[],0,"FORM"];
 			createVehicleCrew _unit2;
		};
		(group _unit2) selectLeader _unit2;
		_unit2 setFormDir 181.94513;
		_unit2 setDir 181.94513;
		_unit2 enableSimulation false; _unit2 disableAI "MOVE"; _unit2 disableAI "ANIM"; _unit2 allowDamage false;
_group3 = createGroup civilian;
	_unit3 = _group3 createUnit ["C_man_p_fugitive_F",[15833.202,19752.881,0],[],0,"FORM"];
		if (isNull _unit3) then {
			_unit3 = createVehicle ["C_man_p_fugitive_F",[15833.202,19752.881,0],[],0,"FORM"];
 			createVehicleCrew _unit3;
		};
		(group _unit3) selectLeader _unit3;
		_unit3 setFormDir 181.94513;
		_unit3 setDir 181.94513;
		_unit3 enableSimulation false; _unit3 disableAI "MOVE"; _unit3 disableAI "ANIM"; _unit3 allowDamage false;
_group4 = createGroup civilian;
	_unit4 = _group4 createUnit ["C_man_p_fugitive_F",[15740.8,17446.959,0],[],0,"FORM"];
		if (isNull _unit4) then {
			_unit4 = createVehicle ["C_man_p_fugitive_F",[15740.8,17446.959,0],[],0,"FORM"];
 			createVehicleCrew _unit4;
		};
		(group _unit4) selectLeader _unit4;
		_unit4 setFormDir 206.84174;
		_unit4 setDir 206.84174;
		_unit4 enableSimulation false; _unit4 disableAI "MOVE"; _unit4 disableAI "ANIM"; _unit4 allowDamage false;
_group5 = createGroup civilian;
	_unit5 = _group5 createUnit ["C_man_p_fugitive_F",[15733.85,17449.516,0],[],0,"FORM"];
		if (isNull _unit5) then {
			_unit5 = createVehicle ["C_man_p_fugitive_F",[15733.85,17449.516,0],[],0,"FORM"];
 			createVehicleCrew _unit5;
		};
		(group _unit5) selectLeader _unit5;
		_unit5 setFormDir 201.27832;
		_unit5 setDir 201.27832;
		_unit5 enableSimulation false; _unit5 disableAI "MOVE"; _unit5 disableAI "ANIM"; _unit5 allowDamage false;

spawnfile = "done";
publicVariable "spawnfile";