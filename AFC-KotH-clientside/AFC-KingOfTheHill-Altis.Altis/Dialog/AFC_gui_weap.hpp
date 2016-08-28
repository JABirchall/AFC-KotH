#define true 1
#define false 0

class rscAFCweapDialog
{
	idd = 1501;
	movingEnable = false;
	enableSimulation = true;
	fadein=0;
	duration = 1e+011;
	fadeout=0;
	onLoad= "";

	controlsBackground[]=
	{
		RscTraderBack,RscWeapFrame,RscHeaderBack,
		RscWeaponBack,RscItemsBack,RscClothesBack
	};
	controls[]=
	{	
		RscPlayerFlag,RscPlayerText,RscButtonClose,RscLevelText,RscXPProgressBar,RscWeapList,
		RscButtonPrimary,RscButtonSecondary,RscButtonLauncher,RscCurrentWeapText,RscBipodList,
		RscBipodText,RscPointerList,RscPointerText,RscMuzzleList,RscMuzzleText,RscOpticList,RscOpticsText,
		RscWeightBar,RscWeightText,RscMagazinesList,RscMagazinesText,RscButtonMagPlus,RscButtonMagMinus,
		RscItemCheckBox,RscButtonUniform,RscButtonVest,RscButtonBackpack,RscButtonHeadgear,RscButtonGlasses,
		RscButtonFaces,RscClothingList,RscCurrentClothText,RscItemsList,RscItemsText,RscButtonItemsPlus,RscButtonItemsMinus,
		RscAssignItemsText,RscLoadoutList,RscButtonLoadoutSave,RscButtonLoadoutLoad,RscButtonSupport,RscButtonExplosives,
		RscButtonFlares

	};
	objects[]=
	{
	};
	class RscTraderBack: IGUIBack
{
	idc = 0;
	x = 0 * safezoneW + safezoneX;
	y = 0 * safezoneH + safezoneY;
	w = 1 * safezoneW;
	h = 1 * safezoneH;
	colorBackground[] = {0,0,0,0.5};
};
	class RscWeapFrame: IGUIBack
{
	idc = 1;
	x = 0.125 * safezoneW + safezoneX;
	y = 0.125 * safezoneH + safezoneY;
	w = 0.75 * safezoneW;
	h = 0.75 * safezoneH;
	colorBackground[] = {0.529,0.565,0.49,1};
};
	class RscHeaderBack: IGUIBack
{
	idc = 2;
	x = 0.13 * safezoneW + safezoneX;
	y = 0.1325 * safezoneH + safezoneY;
	w = 0.74 * safezoneW;
	h = 0.05 * safezoneH;
	colorBackground[] = {0.333,0.333,0.333,0.75};
};
class RscPlayerFlag: RscPicture
{
	idc = 3;
	colorBackground[] = {0,0,0,1};
	sizeEx = 0.1;
	text = "";
	x = 0.1325 * safezoneW + safezoneX;
	y = 0.135 * safezoneH + safezoneY;
	w = 0.05 * safezoneW;
	h = 0.045* safezoneH;	
};
class RscPlayerText: RscStructuredText
{
	idc = 4;
	colorText[] = {1,1,1,1};
	x = 0.185 * safezoneW + safezoneX;
	y = 0.1424 * safezoneH + safezoneY;
	w = 0.6825 * safezoneW;
	h = 0.03 * safezoneH;
	text = "";
};
	class RscButtonClose: RscShortcutButton
{
	idc = 5;
	text = "<t align='center'>Exit with Current Gear</t>";
    colorBackground[] = {0.4,0.4,0.4,1}; 
	colorBackground2[] = {0.4,0.4,0.4,1}; 
	colorBackgroundFocused[] = {0.4,0.4,0.4,1};
	onButtonClick  = "closeDialog 1501;";
	x = 0.6316 * safezoneW + safezoneX;
	y = 0.83 * safezoneH + safezoneY;
	w = 0.232 * safezoneW;
	h = 0.03 * safezoneH;
};
class RscLevelText: RscStructuredText
{
	idc = 6;
	colorText[] = {1,1,1,1};
	x = 0.4 * safezoneW + safezoneX;
	y = 0.1425 * safezoneH + safezoneY;
	w = 0.2 * safezoneW;
	h = 0.03 * safezoneH;
	text = "";
};
class RscXPProgressBar: RscProgress
{
	idc = 7;
	type = 8;
	style = 0;
	colorFrame[] = {1,1,1,1};
	colorBar[] = {1,1,1,1};
	texture = "#(argb,8,8,3)color(1,1,1,1)";
	x = 0.4225 * safezoneW + safezoneX;
	y = 0.145 * safezoneH + safezoneY;
	w = 0.1575 * safezoneW;
	h = 0.0325;
};
	class RscWeaponBack: IGUIBack
{
	idc = 8;
	x = 0.13 * safezoneW + safezoneX;
	y = 0.19 * safezoneH + safezoneY;
	w = 0.2433 * safezoneW;
	h = 0.675 * safezoneH;
	colorBackground[] = {0.333,0.333,0.333,0.75};
};
	class RscClothesBack: IGUIBack
{
	idc = 9;
	x = 0.3783 * safezoneW + safezoneX;
	y = 0.19 * safezoneH + safezoneY;
	w = 0.2433 * safezoneW;
	h = 0.675 * safezoneH;
	colorBackground[] = {0.333,0.333,0.333,0.75};
};
	class RscItemsBack: IGUIBack
{
	idc = 10;
	x = 0.6266 * safezoneW + safezoneX;
	y = 0.19 * safezoneH + safezoneY;
	w = 0.2433 * safezoneW;
	h = 0.675 * safezoneH;
	colorBackground[] = {0.333,0.333,0.333,0.75};
};
	class RscWeapList: RscListBox
{
	idc = 14;
	onLBSelChanged  = "call AFC_fnc_LoadAttachments; call AFC_fnc_LoadAmmo;";
	colorText[] = {1,1,1,1};
	colorDisabled[] = {1,1,1,0.5};
	colorScrollbar[] = {1,0,0,0};
	colorSelect[] = {0,0,0,1};
	colorSelect2[] = {0,0,0,1};
	colorSelectBackground[] = {1,1,1,0.5};
	colorSelectBackground2[] = {0.667,0.714,0.635,1};
	colorBackground[] = {0.667,0.714,0.635,1};
	x = 0.135 * safezoneW + safezoneX;
	y = 0.275 * safezoneH + safezoneY;
	w = 0.2333 * safezoneW;
	h = 0.315 * safezoneH;
};
	class RscButtonPrimary: RscShortcutButton
{
	idc = 15;
	text = "<t align='center'>Primary</t>";
    colorBackground[] = {0.4,0.4,0.4,1}; 
	colorBackground2[] = {0.4,0.4,0.4,1}; 
	colorBackgroundFocused[] = {0.4,0.4,0.4,1}; 
	onButtonClick  = "[1] call AFC_fnc_LoadWeap;[1] call AFC_fnc_CurrentWeap;";
	x = 0.135 * safezoneW + safezoneX;
	y = 0.1975 * safezoneH + safezoneY;
	w = 0.0744 * safezoneW;
	h = 0.035* safezoneH;
};
	class RscButtonSecondary: RscShortcutButton
{
	idc = 16;
	text = "<t align='center'>Secondary</t>";
    colorBackground[] = {0.4,0.4,0.4,1}; 
	colorBackground2[] = {0.4,0.4,0.4,1}; 
	colorBackgroundFocused[] = {0.4,0.4,0.4,1}; 
	onButtonClick  = "[2] call AFC_fnc_LoadWeap;[2] call AFC_fnc_CurrentWeap;";
	x = 0.2144 * safezoneW + safezoneX;
	y = 0.1975 * safezoneH + safezoneY;
	w = 0.0744 * safezoneW;
	h = 0.035* safezoneH;
};
	class RscButtonLauncher: RscShortcutButton
{
	idc = 17;
	text = "<t align='center'>Launcher</t>";
    colorBackground[] = {0.4,0.4,0.4,1}; 
	colorBackground2[] = {0.4,0.4,0.4,1}; 
	colorBackgroundFocused[] = {0.4,0.4,0.4,1};
	onButtonClick  = "[4] call AFC_fnc_LoadWeap;[4] call AFC_fnc_CurrentWeap";
	x = 0.29415 * safezoneW + safezoneX;
	y = 0.1975 * safezoneH + safezoneY;
	w = 0.0744 * safezoneW;
	h = 0.035* safezoneH;
};
class RscCurrentWeapText: RscStructuredText
{
	idc = 18;
	colorText[] = {1,1,1,1};
	x = 0.135 * safezoneW + safezoneX;
	y = 0.24* safezoneH + safezoneY;
	w = 0.2333 * safezoneW;
	h = 0.03 * safezoneH;
	text = "";
};
	class RscBipodList: RscCombo
{
	idc = 19;
	onLBSelChanged  = "[19] call AFC_fnc_AttachItem;";
	colorBackground[] = {0.667,0.714,0.635,1};
	colorSelectBackground[] = {1,1,1,0.5};
	colorSelectBackground2[] = {1,1,1,1};
	colorText[] = {1, 1, 1, 1};
	x = 0.135 * safezoneW + safezoneX;
	y = 0.825 * safezoneH + safezoneY;
	w = 0.2333 * safezoneW;
	h = 0.03 * safezoneH;
};
class RscBipodText: RscStructuredText
{
	idc = 20;
	colorText[] = {1,1,1,1};
	x = 0.135 * safezoneW + safezoneX;
	y = 0.79 * safezoneH + safezoneY;
	w = 0.2333 * safezoneW;
	h = 0.03 * safezoneH;
	text = "<t align='left'>Bipods</t>";
};
	class RscPointerList: RscCombo
{
	idc = 21;
	onLBSelChanged  = "[21] call AFC_fnc_AttachItem;";
	colorBackground[] = {0.667,0.714,0.635,1};
	colorSelectBackground[] = {1,1,1,0.5};
	colorSelectBackground2[] = {1,1,1,1};
	colorText[] = {1, 1, 1, 1};
	x = 0.135 * safezoneW + safezoneX;
	y = 0.7575 * safezoneH + safezoneY;
	w = 0.2333 * safezoneW;
	h = 0.03 * safezoneH;
};
class RscPointerText: RscStructuredText
{
	idc = 22;
	colorText[] = {1,1,1,1};
	x = 0.135 * safezoneW + safezoneX;
	y = 0.7225 * safezoneH + safezoneY;
	w = 0.2333 * safezoneW;
	h = 0.03 * safezoneH;
	text = "<t align='left'>Pointers</t>";
};
	class RscMuzzleList: RscCombo
{
	idc = 23;
	onLBSelChanged  = "[23] call AFC_fnc_AttachItem;";
	colorBackground[] = {0.667,0.714,0.635,1};
	colorSelectBackground[] = {1,1,1,0.5};
	colorSelectBackground2[] = {1,1,1,1};
	colorText[] = {1, 1, 1, 1};
	x = 0.135 * safezoneW + safezoneX;
	y = 0.69 * safezoneH + safezoneY;
	w = 0.2333 * safezoneW;
	h = 0.03 * safezoneH;
};
class RscMuzzleText: RscStructuredText
{
	idc = 24;
	colorText[] = {1,1,1,1};
	x = 0.135 * safezoneW + safezoneX;
	y = 0.6575 * safezoneH + safezoneY;
	w = 0.2333 * safezoneW;
	h = 0.03 * safezoneH;
	text = "<t align='left'>Muzzles</t>";
};
	class RscOpticList: RscCombo
{
	idc = 25;
	onLBSelChanged  = "[25] call AFC_fnc_AttachItem;";
	colorBackground[] = {0.667,0.714,0.635,1};
	colorSelectBackground[] = {1,1,1,0.5};
	colorSelectBackground2[] = {1,1,1,1};
	colorText[] = {1, 1, 1, 1};
	x = 0.135 * safezoneW + safezoneX;
	y = 0.625 * safezoneH + safezoneY;
	w = 0.2333 * safezoneW;
	h = 0.03 * safezoneH;
};
	class RscOpticsText: RscStructuredText
{
	idc = 26;
	colorText[] = {1,1,1,1};
	x = 0.135 * safezoneW + safezoneX;
	y = 0.59 * safezoneH + safezoneY;
	w = 0.2333 * safezoneW;
	h = 0.03 * safezoneH;
	text = "<t align='left'>Optics</t>";
};
class RscWeightBar: RscProgress
{
	idc = 27;
	type = 8;
	style = 0;
	colorFrame[] = {1,1,1,1};
	colorBar[] = {0.667,0.714,0.635,1};
	texture = "#(argb,8,8,3)color(1,1,1,1)";
	x = 0.38375 * safezoneW + safezoneX;
	y = 0.8275 * safezoneH + safezoneY;
	w = 0.232 * safezoneW;
	h = 0.0375;
};
	class RscWeightText: RscStructuredText
{
	idc = 28;
	colorText[] = {1,1,1,1};
	x = 0.38375 * safezoneW + safezoneX;
	y = 0.79 * safezoneH + safezoneY;
	w = 0.232 * safezoneW;
	h = 0.03 * safezoneH;
	text = "<t align='center'>Weight</t>";
};	
		class RscMagazinesList: RscListBox
{
	idc = 29;
	onLBSelChanged  = "call AFC_fnc_CountMags;";
	colorText[] = {1,1,1,1};
	colorDisabled[] = {1,1,1,0.5};
	colorScrollbar[] = {1,0,0,0};
	colorSelect[] = {0,0,0,1};
	colorSelect2[] = {0,0,0,1};
	colorSelectBackground[] = {1,1,1,0.5};
	colorSelectBackground2[] = {0.667,0.714,0.635,1};
	colorBackground[] = {0.667,0.714,0.635,1};
	x = 0.38375 * safezoneW + safezoneX;
	y = 0.6275 * safezoneH + safezoneY;
	w = 0.232 * safezoneW;
	h = 0.16 * safezoneH;
};
class RscMagazinesText: RscStructuredText
{
	idc = 30;
	colorText[] = {1,1,1,1};
	x = 0.3825 * safezoneW + safezoneX;
	y = 0.5925 * safezoneH + safezoneY;
	w = 0.19 * safezoneW;
	h = 0.03 * safezoneH;
	text = "<t align='left'>Magazines</t><t align='right'>0</t>";
};
	class RscButtonMagPlus: RscShortcutButton
{
	idc = 31;
	text = "<t align='center'>+</t>";
    colorBackground[] = {0.4,0.4,0.4,1}; 
	colorBackground2[] = {0.4,0.4,0.4,1}; 
	colorBackgroundFocused[] = {0.4,0.4,0.4,1}; 
	onButtonClick  = "[1] call AFC_fnc_AddMags;";
	x = 0.595 * safezoneW + safezoneX;
	y = 0.5925 * safezoneH + safezoneY;
	w = 0.02 * safezoneW;
	h = 0.03* safezoneH;
};
	class RscButtonMagMinus: RscShortcutButton
{
	idc = 32;
	text = "<t align='center'>-</t>";
    colorBackground[] = {0.4,0.4,0.4,1}; 
	colorBackground2[] = {0.4,0.4,0.4,1}; 
	colorBackgroundFocused[] = {0.4,0.4,0.4,1}; 
	onButtonClick  = "[0] call AFC_fnc_AddMags;";
	x = 0.5725 * safezoneW + safezoneX;
	y = 0.5925 * safezoneH + safezoneY;
	w = 0.02 * safezoneW;
	h = 0.03* safezoneH;
};
class RscItemCheckBox: RscTextCheckBox
{
	idc = 33;
	x = 0.6316 * safezoneW + safezoneX;
	y = 0.6275 * safezoneH + safezoneY;
	w = 0.232 * safezoneW;
	h = 0.1225 * safezoneH;
	sizeEx = 0.04;
	onCheckBoxesSelChanged = "[_this] call AFC_fnc_ItemCheckBox;";
	colorText[] = {0,0,0,1};
	color[] = {0,0,0,0};
	colorBackground[] = {0.667,0.714,0.635,1};
	colorTextSelect[] = {0,0,0,1};
	colorSelectedBg[] = {1,1,1,0.5};
	colorSelect[] = {0,0,0,1};
	colorTextDisable[] = {0.4,0.4,0.4,1};
	colorDisable[] = {0.4,0.4,0.4,1};
	rows = 3;
	columns = 3;
	strings[] = {"Map","Compass","GPS","NVG","Radio","Watch","Binocular","Rangefinder","UAV"};
	checked_strings[] = {"Map","Compass","GPS","NVG","Radio","Watch","Binocular","Rangefinder","UAV"};
};
	class RscButtonUniform: RscShortcutButton
{
	idc = 34;
	text = "<t align='center'>Uniform</t>";
    colorBackground[] = {0.4,0.4,0.4,1}; 
	colorBackground2[] = {0.4,0.4,0.4,1}; 
	colorBackgroundFocused[] = {0.4,0.4,0.4,1};
	onButtonClick  = "[0] call AFC_fnc_LoadUniform;[0] call AFC_fnc_CurrentCloth;";
	x = 0.38375 * safezoneW + safezoneX;
	y = 0.1975 * safezoneH + safezoneY;
	w = 0.0744 * safezoneW;
	h = 0.035* safezoneH;
};
	class RscButtonVest: RscShortcutButton
{
	idc = 35;
	text = "<t align='center'>Vest</t>";
    colorBackground[] = {0.4,0.4,0.4,1}; 
	colorBackground2[] = {0.4,0.4,0.4,1}; 
	colorBackgroundFocused[] = {0.4,0.4,0.4,1};
	onButtonClick  = "[1] call AFC_fnc_LoadUniform;[1] call AFC_fnc_CurrentCloth;";
	x = 0.4625 * safezoneW + safezoneX;
	y = 0.1975 * safezoneH + safezoneY;
	w = 0.0744 * safezoneW;
	h = 0.035* safezoneH;
};
	class RscButtonBackpack: RscShortcutButton
{
	idc = 36;
	text = "<t align='center'>Backpack</t>";
    colorBackground[] = {0.4,0.4,0.4,1}; 
	colorBackground2[] = {0.4,0.4,0.4,1}; 
	colorBackgroundFocused[] = {0.4,0.4,0.4,1};
	onButtonClick  = "[2] call AFC_fnc_LoadUniform;[2] call AFC_fnc_CurrentCloth;";
	x = 0.5413 * safezoneW + safezoneX;
	y = 0.1975 * safezoneH + safezoneY;
	w = 0.0744 * safezoneW;
	h = 0.035* safezoneH;
};
	class RscButtonHeadgear: RscShortcutButton
{
	idc = 37;
	text = "<t align='center'>Headgear</t>";
    colorBackground[] = {0.4,0.4,0.4,1}; 
	colorBackground2[] = {0.4,0.4,0.4,1}; 
	colorBackgroundFocused[] = {0.4,0.4,0.4,1};
	onButtonClick  = "[3] call AFC_fnc_LoadUniform;[3] call AFC_fnc_CurrentCloth;";
	x = 0.38375 * safezoneW + safezoneX;
	y = 0.24 * safezoneH + safezoneY;
	w = 0.0744 * safezoneW;
	h = 0.035* safezoneH;
};
	class RscButtonGlasses: RscShortcutButton
{
	idc = 37;
	text = "<t align='center'>Glasses</t>";
    colorBackground[] = {0.4,0.4,0.4,1}; 
	colorBackground2[] = {0.4,0.4,0.4,1}; 
	colorBackgroundFocused[] = {0.4,0.4,0.4,1};
	onButtonClick  = "[4] call AFC_fnc_LoadUniform;[4] call AFC_fnc_CurrentCloth;";
	x = 0.4625 * safezoneW + safezoneX;
	y = 0.24 * safezoneH + safezoneY;
	w = 0.0744 * safezoneW;
	h = 0.035* safezoneH;
};
	class RscButtonFaces: RscShortcutButton
{
	idc = 38;
	text = "<t align='center'>Face</t>";
    colorBackground[] = {0.4,0.4,0.4,1}; 
	colorBackground2[] = {0.4,0.4,0.4,1}; 
	colorBackgroundFocused[] = {0.4,0.4,0.4,1};
	onButtonClick  = "call AFC_fnc_LoadFaces;[5] call AFC_fnc_CurrentCloth;";
	x = 0.5413 * safezoneW + safezoneX;
	y = 0.24 * safezoneH + safezoneY;
	w = 0.0744 * safezoneW;
	h = 0.035* safezoneH;
};
	class RscClothingList: RscListBox
{
	idc = 39;
	onLBSelChanged  = "call AFC_fnc_AddClothing;";
	colorText[] = {1,1,1,1};
	colorDisabled[] = {1,1,1,0.5};
	colorScrollbar[] = {1,0,0,0};
	colorSelect[] = {0,0,0,1};
	colorSelect2[] = {0,0,0,1};
	colorSelectBackground[] = {1,1,1,0.5};
	colorSelectBackground2[] = {0.667,0.714,0.635,1};
	colorBackground[] = {0.667,0.714,0.635,1};
	x = 0.38375 * safezoneW + safezoneX;
	y = 0.3125 * safezoneH + safezoneY;
	w = 0.232 * safezoneW;
	h = 0.275 * safezoneH;
};
class RscCurrentClothText: RscStructuredText
{
	idc = 40;
	colorText[] = {1,1,1,1};
	x = 0.38375 * safezoneW + safezoneX;
	y = 0.28 * safezoneH + safezoneY;
	w = 0.2333 * safezoneW;
	h = 0.03 * safezoneH;
	text = "Current";
};
	class RscItemsList: RscListBox
{
	idc = 41;
	onLBSelChanged  = "call AFC_fnc_CountItems;";
	colorText[] = {1,1,1,1};
	colorDisabled[] = {1,1,1,0.5};
	colorScrollbar[] = {1,0,0,0};
	colorSelect[] = {0,0,0,1};
	colorSelect2[] = {0,0,0,1};
	colorSelectBackground[] = {1,1,1,0.5};
	colorSelectBackground2[] = {0.667,0.714,0.635,1};
	colorBackground[] = {0.667,0.714,0.635,1};
	x = 0.6316 * safezoneW + safezoneX;
	y = 0.275 * safezoneH + safezoneY;
	w = 0.232 * safezoneW;
	h = 0.315 * safezoneH;
};

	class RscItemsText: RscStructuredText
{
	idc = 42;
	colorText[] = {1,1,1,1};
	x = 0.6316 * safezoneW + safezoneX;
	y = 0.24* safezoneH + safezoneY;
	w = 0.19 * safezoneW;
	h = 0.03 * safezoneH;
	text = "<t align='Left'>Items</t><t align='right'>0</t>";
};
	class RscButtonItemsPlus: RscShortcutButton
{
	idc = 43;
	text = "<t align='center'>+</t>";
    colorBackground[] = {0.4,0.4,0.4,1}; 
	colorBackground2[] = {0.4,0.4,0.4,1}; 
	colorBackgroundFocused[] = {0.4,0.4,0.4,1}; 
	onButtonClick  = "[1] call AFC_fnc_AddItems;";
	x = 0.84375 * safezoneW + safezoneX;
	y = 0.24* safezoneH + safezoneY;
	w = 0.02 * safezoneW;
	h = 0.03* safezoneH;
};
	class RscButtonItemsMinus: RscShortcutButton
{
	idc = 44;
	text = "<t align='center'>-</t>";
    colorBackground[] = {0.4,0.4,0.4,1}; 
	colorBackground2[] = {0.4,0.4,0.4,1}; 
	colorBackgroundFocused[] = {0.4,0.4,0.4,1}; 
	onButtonClick  = "[0] call AFC_fnc_AddItems;";
	x = 0.8225 * safezoneW + safezoneX;
	y = 0.24* safezoneH + safezoneY;
	w = 0.02 * safezoneW;
	h = 0.03* safezoneH;
};

class RscAssignItemsText: RscStructuredText
{
	idc = 45;
	colorText[] = {1,1,1,1};
	x = 0.6316 * safezoneW + safezoneX;
	y = 0.5925 * safezoneH + safezoneY;
	w = 0.232 * safezoneW;
	h = 0.03 * safezoneH;
	text = "<t align='center'>None Selected</t>";
};
	class RscLoadoutList: RscCombo
{
	idc = 46;
	onLBSelChanged  = "";
	colorBackground[] = {0.667,0.714,0.635,1};
	colorSelectBackground[] = {1,1,1,0.5};
	colorSelectBackground2[] = {1,1,1,1};
	colorText[] = {1, 1, 1, 1};
	x = 0.6316 * safezoneW + safezoneX;
	y = 0.7575 * safezoneH + safezoneY;
	w = 0.232 * safezoneW;
	h = 0.03 * safezoneH;
};
	class RscButtonLoadoutSave: RscShortcutButton
{
	idc = 47;
	text = "<t align='center'>Save As</t>";
    colorBackground[] = {0.4,0.4,0.4,1}; 
	colorBackground2[] = {0.4,0.4,0.4,1}; 
	colorBackgroundFocused[] = {0.4,0.4,0.4,1};
	onButtonClick  = "[0] call AFC_fnc_LoadnSave;";
	x = 0.6316 * safezoneW + safezoneX;
	y = 0.7925 * safezoneH + safezoneY;
	w = 0.1135 * safezoneW;
	h = 0.0325* safezoneH;
};
	class RscButtonLoadoutLoad: RscShortcutButton
{
	idc = 48;
	text = "<t align='center'>Load</t>";
    colorBackground[] = {0.4,0.4,0.4,1}; 
	colorBackground2[] = {0.4,0.4,0.4,1}; 
	colorBackgroundFocused[] = {0.4,0.4,0.4,1};
	onButtonClick  = "[1] call AFC_fnc_LoadnSave;closeDialog 1501;";
	x = 0.75 * safezoneW + safezoneX;
	y = 0.7925 * safezoneH + safezoneY;
	w = 0.1135 * safezoneW;
	h = 0.0325* safezoneH;
};
	class RscButtonSupport: RscShortcutButton
{
	idc = 49;
	text = "<t align='center'>Support</t>";
    colorBackground[] = {0.4,0.4,0.4,1}; 
	colorBackground2[] = {0.4,0.4,0.4,1}; 
	colorBackgroundFocused[] = {0.4,0.4,0.4,1};
	onButtonClick  = "[0] call AFC_fnc_LoadItems;";
	x = 0.6316 * safezoneW + safezoneX;
	y = 0.1975 * safezoneH + safezoneY;
	w = 0.0744 * safezoneW;
	h = 0.035* safezoneH;
};
	class RscButtonExplosives: RscShortcutButton
{
	idc = 50;
	text = "<t align='center'>Explosives</t>";
    colorBackground[] = {0.4,0.4,0.4,1}; 
	colorBackground2[] = {0.4,0.4,0.4,1}; 
	colorBackgroundFocused[] = {0.4,0.4,0.4,1};
	onButtonClick  = "[1] call AFC_fnc_LoadItems;";
	x = 0.7111 * safezoneW + safezoneX;
	y = 0.1975 * safezoneH + safezoneY;
	w = 0.0744 * safezoneW;
	h = 0.035* safezoneH;
};
	class RscButtonFlares: RscShortcutButton
{
	idc = 51;
	text = "<t align='center'>Flares</t>";
    colorBackground[] = {0.4,0.4,0.4,1}; 
	colorBackground2[] = {0.4,0.4,0.4,1}; 
	colorBackgroundFocused[] = {0.4,0.4,0.4,1};
	onButtonClick  = "[2] call AFC_fnc_LoadItems;";
	x = 0.79 * safezoneW + safezoneX;
	y = 0.1975 * safezoneH + safezoneY;
	w = 0.0744 * safezoneW;
	h = 0.035* safezoneH;
};
};