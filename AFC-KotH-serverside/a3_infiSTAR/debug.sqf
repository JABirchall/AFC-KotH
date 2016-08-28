fnc_setPNS = compileFinal '
	profileNameSpace setVariable _this;saveProfileNamespace;
';
fnc_getPNS = compileFinal '
	profileNameSpace getVariable _this
';
fnc_admin_ccc = {
	if(isNil'_this')exitWith{''};
	_out = compile _this;
	if(isNil'_out')exitWith{_this};
	call _out
};
fnc_lbDebugChanged = {
	disableSerialization;
	_ctrl = _this select 0;
	_index = _this select 1;
	((findDisplay -1341) displayCtrl 1) ctrlSetText (['infiSTAR_SAVED_FUNCTIONS',[]] call fnc_getPNS select _index);
};
fnc_fillDebugListBox = {
	_listbox = (findDisplay -1341) displayCtrl 1384;
	_listbox ctrlRemoveAllEventHandlers 'LBDblClick';
	_listbox ctrlRemoveAllEventHandlers 'LBSelChanged';		
	_listbox ctrlAddEventHandler ['LBDblClick', 'call fnc_lbDebugChanged;true'];
	_listbox ctrlAddEventHandler ['LBSelChanged', 'call fnc_lbDebugChanged;true'];
	lbClear _listbox;
	
	_var = ['infiSTAR_SAVED_FUNCTIONS',[]] call fnc_getPNS;
	if!(_var isEqualTo [])then
	{
		{
			_lbid = _listbox lbAdd _x;
		} forEach _var;
	};
};
workplace_dialog = 'infiSTAR_EDITBOX2';
fnc_ServerOrGLobal = {
	if(!isNil'GLOBAL_EXECUTE_BUTTON_THREAD')then{terminate GLOBAL_EXECUTE_BUTTON_THREAD;GLOBAL_EXECUTE_BUTTON_THREAD=nil;};
	GLOBAL_EXECUTE_BUTTON_THREAD = _this spawn {
		disableSerialization;
		_display = findDisplay 49;if!(isNull _display)then{_display closeDisplay 2;};
		_result = [
				format['EXECUTE %1?',_this select 2],
				'PLEASE CONFIRM',
				'Yes',
				'Nah'
			] call BIS_fnc_guiMessage;
		waitUntil { !isNil '_result' };
		if(_result)then
		{
			[(_this select 0)] call (_this select 1);
		}
		else
		{
			terminate GLOBAL_EXECUTE_BUTTON_THREAD;GLOBAL_EXECUTE_BUTTON_THREAD=nil;
		};
	};
};
fnc_workplace = {
	disableSerialization;
	if(isNull findDisplay -1341)then{createdialog workplace_dialog;'AdminConsole' call fnc_adminLog;};
	_display = findDisplay -1341;
	_buttonheight = 0.05;
	
_wfposY = safeZoneY + 0.01;
	_wf1 = _display displayCtrl 1380;
	_wf1 ctrlSetPosition [0,_wfposY,1,_buttonheight];
	_wf1 ctrlCommit 0;
	
	_wf1cb = [_display,'RscCheckBox',1360] call fnc_createctrl;
	_wf1cb cbSetChecked (['cbChecked__wf1',false] call fnc_getPNS);
	_wf1cb ctrlSetPosition [-_buttonheight,_wfposY,_buttonheight,_buttonheight];
	_wf1cb ctrlSetEventHandler['CheckedChanged','[''cbChecked__wf1'',(_this select 1) isEqualTo 1] call fnc_setPNS;true'];
	_wf1cb ctrlSetTooltip 'ALWAYS SHOW';
	_wf1cb ctrlCommit 0;
	
	
	_wf1cb1 = [_display,'RSCButton',1461] call fnc_createctrl;
	_wf1cb1 ctrlSetText 'copy';
	_wf1cb1 ctrlSetPosition [1,_wfposY,0.09,_buttonheight];
	_wf1cb1 ctrlCommit 0;
	_wf1cb1 ctrlSetEventHandler['ButtonClick','((findDisplay -1341) displayCtrl 7564982345) ctrlSetText ctrlText((findDisplay 46) displayCtrl 1362);true'];
	
	_wf1cb2 = [_display,'RSCButton',1361] call fnc_createctrl;
	_wf1cb2 ctrlSetText 'clear';
	_wf1cb2 ctrlSetPosition [1.09,_wfposY,0.09,_buttonheight];
	_wf1cb2 ctrlCommit 0;
	_wf1cb2 ctrlSetEventHandler['ButtonClick','((findDisplay -1341) displayCtrl 1380) ctrlSetText '''';[''wf1tTCT'',''''] call fnc_setPNS;true'];
	
	if(!isNil'wf1T')then{terminate wf1T;wf1T=nil;};
	wf1T = [0,_wfposY+0.045,1,_buttonheight] spawn {
		disableSerialization;
		_oldText = ['wf1tTCT',''] call fnc_getPNS;
		
		_display = findDisplay -1341;
		_wf1 = _display displayCtrl 1380;
		_wf1 ctrlSetText _oldText;
		
		_wf1t = [findDisplay 46,'RSCText',1362] call fnc_createctrl;
		_wf1t ctrlSetPosition _this;
		_wf1t ctrlCommit 0;
		while {true} do
		{
			if((isNull _wf1) && !(['cbChecked__wf1',false] call fnc_getPNS))exitWith{};
			
			_oldText = ['wf1tTCT',''] call fnc_getPNS;
			if(!isNull _wf1)then
			{
				_ctrltext = ctrlText _wf1;
				if!(_ctrltext isEqualTo '')then
				{
					if!(_ctrltext isEqualTo _oldText)then
					{
						['wf1tTCT',_ctrltext] call fnc_setPNS;
					};
				};
			};
			
			if!(_oldText isEqualTo '')then
			{
				private '_ret';
				_ret = _oldText call fnc_admin_ccc;
				if(!isNil'_ret')then{_wf1t ctrlSetText (str _ret);};
			};
			uiSleep 0.01;
		};
	};

	_wfposY = _wfposY + 0.1;
	_wf2 = _display displayCtrl 1381;
	_wf2 ctrlSetPosition [0,_wfposY,1,_buttonheight];
	_wf2 ctrlCommit 0;
	
	_wf2cb = [_display,'RscCheckBox',1260] call fnc_createctrl;
	_wf2cb cbSetChecked (['cbChecked__wf2',false] call fnc_getPNS);
	_wf2cb ctrlSetPosition [-_buttonheight,_wfposY,_buttonheight,_buttonheight];
	_wf2cb ctrlSetEventHandler['CheckedChanged','[''cbChecked__wf2'',(_this select 1) isEqualTo 1] call fnc_setPNS;true'];
	_wf2cb ctrlSetTooltip 'ALWAYS SHOW';
	_wf2cb ctrlCommit 0;
	
	_wf2cb1 = [_display,'RSCButton',1561] call fnc_createctrl;
	_wf2cb1 ctrlSetText 'copy';
	_wf2cb1 ctrlSetPosition [1,_wfposY,0.09,_buttonheight];
	_wf2cb1 ctrlCommit 0;
	_wf2cb1 ctrlSetEventHandler['ButtonClick','((findDisplay -1341) displayCtrl 7564982345) ctrlSetText ctrlText((findDisplay 46) displayCtrl 1262);true'];
	
	_wf2cb2 = [_display,'RSCButton',1261] call fnc_createctrl;
	_wf2cb2 ctrlSetText 'clear';
	_wf2cb2 ctrlSetPosition [1.09,_wfposY,0.09,_buttonheight];
	_wf2cb2 ctrlCommit 0;
	_wf2cb2 ctrlSetEventHandler['ButtonClick','((findDisplay -1341) displayCtrl 1381) ctrlSetText '''';[''wf2tTCT'',''''] call fnc_setPNS;true'];
	
	if(!isNil'wf2T')then{terminate wf2T;wf2T=nil;};
	wf2T = [0,_wfposY+0.045,1,_buttonheight] spawn {
		disableSerialization;
		_oldText = ['wf2tTCT',''] call fnc_getPNS;
		
		_display = findDisplay -1341;
		_wf2 = _display displayCtrl 1381;
		_wf2 ctrlSetText _oldText;
		
		_wf2t = [findDisplay 46,'RSCText',1262] call fnc_createctrl;
		_wf2t ctrlSetPosition _this;
		_wf2t ctrlCommit 0;
		while {true} do
		{
			if((isNull _wf2) && !(['cbChecked__wf2',false] call fnc_getPNS))exitWith{};
			
			_oldText = ['wf2tTCT',''] call fnc_getPNS;
			if(!isNull _wf2)then
			{
				_ctrltext = ctrlText _wf2;
				if!(_ctrltext isEqualTo '')then
				{
					if!(_ctrltext isEqualTo _oldText)then
					{
						['wf2tTCT',_ctrltext] call fnc_setPNS;
					};
				};
			};
			
			if!(_oldText isEqualTo '')then
			{
				private '_ret';
				_ret = _oldText call fnc_admin_ccc;
				if(!isNil'_ret')then{_wf2t ctrlSetText (str _ret);};
			};
			uiSleep 0.01;
		};
	};


	_wfposY = _wfposY + 0.1;
	_wf3 = _display displayCtrl 1382;
	_wf3 ctrlSetPosition [0,_wfposY,1,_buttonheight];
	_wf3 ctrlCommit 0;
	
	_wf3cb = [_display,'RscCheckBox',1160] call fnc_createctrl;
	_wf3cb cbSetChecked (['cbChecked__wf3',false] call fnc_getPNS);
	_wf3cb ctrlSetPosition [-_buttonheight,_wfposY,_buttonheight,_buttonheight];
	_wf3cb ctrlSetEventHandler['CheckedChanged','[''cbChecked__wf3'',(_this select 1) isEqualTo 1] call fnc_setPNS;true'];
	_wf3cb ctrlSetTooltip 'ALWAYS SHOW';
	_wf3cb ctrlCommit 0;
	
	_wf3cb1 = [_display,'RSCButton',1661] call fnc_createctrl;
	_wf3cb1 ctrlSetText 'copy';
	_wf3cb1 ctrlSetPosition [1,_wfposY,0.09,_buttonheight];
	_wf3cb1 ctrlCommit 0;
	_wf3cb1 ctrlSetEventHandler['ButtonClick','((findDisplay -1341) displayCtrl 7564982345) ctrlSetText ctrlText((findDisplay 46) displayCtrl 1162);true'];
	
	_wf3cb2 = [_display,'RSCButton',1161] call fnc_createctrl;
	_wf3cb2 ctrlSetText 'clear';
	_wf3cb2 ctrlSetPosition [1.09,_wfposY,0.09,_buttonheight];
	_wf3cb2 ctrlCommit 0;
	_wf3cb2 ctrlSetEventHandler['ButtonClick','((findDisplay -1341) displayCtrl 1382) ctrlSetText '''';[''wf3tTCT'',''''] call fnc_setPNS;true'];
	
	if(!isNil'wf3T')then{terminate wf3T;wf3T=nil;};
	wf3T = [0,_wfposY+0.045,1,_buttonheight] spawn {
		disableSerialization;
		_oldText = ['wf3tTCT',''] call fnc_getPNS;
		
		_display = findDisplay -1341;
		_wf3 = _display displayCtrl 1382;
		_wf3 ctrlSetText _oldText;
		
		_wf3t = [findDisplay 46,'RSCText',1162] call fnc_createctrl;
		_wf3t ctrlSetPosition _this;
		_wf3t ctrlCommit 0;
		while {true} do
		{
			if((isNull _wf3) && !(['cbChecked__wf3',false] call fnc_getPNS))exitWith{};
			
			_oldText = ['wf3tTCT',''] call fnc_getPNS;
			if(!isNull _wf3)then
			{
				_ctrltext = ctrlText _wf3;
				if!(_ctrltext isEqualTo '')then
				{
					if!(_ctrltext isEqualTo _oldText)then
					{
						['wf3tTCT',_ctrltext] call fnc_setPNS;
					};
				};
			};
			
			if!(_oldText isEqualTo '')then
			{
				private '_ret';
				_ret = _oldText call fnc_admin_ccc;
				if(!isNil'_ret')then{_wf3t ctrlSetText (str _ret);};
			};
			uiSleep 0.01;
		};
	};


	_wfposY = _wfposY + 0.1;
	_wf4 = _display displayCtrl 1383;
	_wf4 ctrlSetPosition [0,_wfposY,1,_buttonheight];
	_wf4 ctrlCommit 0;
	
	_wf4cb = [_display,'RscCheckBox',1060] call fnc_createctrl;
	_wf4cb cbSetChecked (['cbChecked__wf4',false] call fnc_getPNS);
	_wf4cb ctrlSetPosition [-_buttonheight,_wfposY,_buttonheight,_buttonheight];
	_wf4cb ctrlSetEventHandler['CheckedChanged','[''cbChecked__wf4'',(_this select 1) isEqualTo 1] call fnc_setPNS;true'];
	_wf4cb ctrlSetTooltip 'ALWAYS SHOW';
	_wf4cb ctrlCommit 0;
	
	_wf4cb1 = [_display,'RSCButton',1761] call fnc_createctrl;
	_wf4cb1 ctrlSetText 'copy';
	_wf4cb1 ctrlSetPosition [1,_wfposY,0.09,_buttonheight];
	_wf4cb1 ctrlCommit 0;
	_wf4cb1 ctrlSetEventHandler['ButtonClick','((findDisplay -1341) displayCtrl 7564982345) ctrlSetText ctrlText((findDisplay 46) displayCtrl 1062);true'];
	
	_wf4cb2 = [_display,'RSCButton',1061] call fnc_createctrl;
	_wf4cb2 ctrlSetText 'clear';
	_wf4cb2 ctrlSetPosition [1.09,_wfposY,0.09,_buttonheight];
	_wf4cb2 ctrlCommit 0;
	_wf4cb2 ctrlSetEventHandler['ButtonClick','((findDisplay -1341) displayCtrl 1383) ctrlSetText '''';[''wf4tTCT'',''''] call fnc_setPNS;true'];
	
	if(!isNil'wf4T')then{terminate wf4T;wf4T=nil;};
	wf4T = [0,_wfposY+0.045,1,_buttonheight] spawn {
		disableSerialization;
		_oldText = ['wf4tTCT',''] call fnc_getPNS;
		
		_display = findDisplay -1341;
		_wf4 = _display displayCtrl 1383;
		_wf4 ctrlSetText _oldText;
		
		_wf4t = [findDisplay 46,'RSCText',1062] call fnc_createctrl;
		_wf4t ctrlSetPosition _this;
		_wf4t ctrlCommit 0;
		while {true} do
		{
			if((isNull _wf4) && !(['cbChecked__wf4',false] call fnc_getPNS))exitWith{};
			
			_oldText = ['wf4tTCT',''] call fnc_getPNS;
			if(!isNull _wf4)then
			{
				_ctrltext = ctrlText _wf4;
				if!(_ctrltext isEqualTo '')then
				{
					if!(_ctrltext isEqualTo _oldText)then
					{
						['wf4tTCT',_ctrltext] call fnc_setPNS;
					};
				};
			};
			
			if!(_oldText isEqualTo '')then
			{
				private '_ret';
				_ret = _oldText call fnc_admin_ccc;
				if(!isNil'_ret')then{_wf4t ctrlSetText (str _ret);};
			};
			uiSleep 0.01;
		};
	};


	_ctrl = [_display,'RSCEdit',7564982345] call fnc_createctrl;
	_ctrl ctrlSetPosition [0,_wfposY + 0.245,1,_buttonheight];
	_ctrl ctrlSetBackgroundColor [0,0,0,0.6];
	_ctrl ctrlCommit 0;




	_ctrl = _display displayCtrl 1339;
_startYpos = safeZoneY + 0.61;
_ctrl ctrlSetPosition [0,_startYpos,1,1];
	_ctrl ctrlCommit 0;
	_class = lbData[RIGHT_CTRL_ID,(lbCurSel RIGHT_CTRL_ID)];
	if(_class isEqualTo '')then
	{
		_class = ['workplacemainwindow',''] call fnc_getPNS;
	};
	_ctrl ctrlSetText _class;diag_log _class;
	if(!isNil'workplacemainwindowT')then{terminate workplacemainwindowT;workplacemainwindowT=nil;};
	workplacemainwindowT = [] spawn {
		disableSerialization;
		while{true}do
		{
			_ctrl = (findDisplay -1341) displayCtrl 1339;
			if(isNull _ctrl)exitWith{workplacemainwindowT=nil;};
			
			_ctext = ctrlText _ctrl;
			_vtext = ['workplacemainwindow',''] call fnc_getPNS;
			if!(_ctext isEqualTo _vtext)then
			{
				['workplacemainwindow',_ctext] call fnc_setPNS;
			};
			uiSleep 0.01;
		};
	};
	_ctrlid = 7338;

	_ctrlid = _ctrlid + 1;
	_ctrl = [_display,'RSCButton',_ctrlid] call fnc_createctrl;
	_ctrl ctrlSetText 'GLOBAL EXECUTE';
	_ctrl ctrlSetPosition [0,_startYpos + 1,0.25,_buttonheight];
	_ctrl ctrlCommit 0;
	_ctrl ctrlSetEventHandler['ButtonClick','[ctrlText((findDisplay -1341) displayCtrl 1339),admin_d0,''GLOBAL''] call fnc_ServerOrGLobal;true'];


	_ctrlid = _ctrlid + 1;
	_ctrl = [_display,'RSCButton',_ctrlid] call fnc_createctrl;
	_ctrl ctrlSetText 'SERVER EXECUTE';
	_ctrl ctrlSetPosition [0.25,_startYpos + 1,0.25,_buttonheight];
	_ctrl ctrlCommit 0;
	_ctrl ctrlSetEventHandler['ButtonClick','[ctrlText((findDisplay -1341) displayCtrl 1339),admin_d0_server,''ON SERVER''] call fnc_ServerOrGLobal;true'];


	_ctrlid = _ctrlid + 1;
	_ctrl = [_display,'RSCButton',_ctrlid] call fnc_createctrl;
	_ctrl ctrlSetText 'LOCAL EXECUTE';
	_ctrl ctrlSetPosition [0.5,_startYpos + 1,0.25,_buttonheight];
	_ctrl ctrlCommit 0;
	_ctrl ctrlSetEventHandler['ButtonClick','(ctrlText((findDisplay -1341) displayCtrl 1339))call fnc_admin_ccc;true'];


	_ctrlid = _ctrlid + 1;
	_ctrl = [_display,'RSCButton',_ctrlid] call fnc_createctrl;
	_ctrl ctrlSetText 'CLEAR';
	_ctrl ctrlSetPosition [0.75,_startYpos + 1,0.25,_buttonheight];
	_ctrl ctrlCommit 0;
	_ctrl ctrlSetEventHandler['ButtonClick','((findDisplay -1341) displayCtrl 1339) ctrlSetText '''';[''workplacemainwindow'',''''] call fnc_setPNS;true'];





_buttonYpos = _startYpos;
	_ctrlid = _ctrlid + 1;
	_ctrl = [_display,'RSCButton',_ctrlid] call fnc_createctrl;
	_ctrl ctrlSetText 'ALL ITEMS';
	_ctrl ctrlSetPosition [1,_buttonYpos,0.25,_buttonheight];
	_ctrl ctrlCommit 0;
	_ctrl ctrlSetEventHandler['ButtonClick','((findDisplay -1341) displayCtrl 1339) ctrlSetText str ALLC_ITEMS;true'];

	_buttonYpos = _buttonYpos + _buttonheight;
	_ctrlid = _ctrlid + 1;
	_ctrl = [_display,'RSCButton',_ctrlid] call fnc_createctrl;
	_ctrl ctrlSetText 'ALL VEHICLES';
	_ctrl ctrlSetPosition [1,_buttonYpos,0.25,_buttonheight];
	_ctrl ctrlCommit 0;
	_ctrl ctrlSetEventHandler['ButtonClick','_txt = str ALL_VEHS_TO_SEARCH_C;((findDisplay -1341) displayCtrl 1339) ctrlSetText _txt;diag_log _txt;true'];

	_buttonYpos = _buttonYpos + _buttonheight + _buttonheight;
	_ctrlid = _ctrlid + 1;
	_ctrl = [_display,'RSCButton',_ctrlid] call fnc_createctrl;
	_ctrl ctrlSetText 'CURSORTARGET';
	_ctrl ctrlSetPosition [1,_buttonYpos,0.25,_buttonheight];
	_ctrl ctrlCommit 0;
	_ctrl ctrlSetEventHandler['ButtonClick','_txt = typeOf cursorTarget;((findDisplay -1341) displayCtrl 1339) ctrlSetText _txt;diag_log _txt;true'];

	_buttonYpos = _buttonYpos + _buttonheight;
	_ctrlid = _ctrlid + 1;
	_ctrl = [_display,'RSCButton',_ctrlid] call fnc_createctrl;
	_ctrl ctrlSetText 'VEHICLE PLAYER';
	_ctrl ctrlSetPosition [1,_buttonYpos,0.25,_buttonheight];
	_ctrl ctrlCommit 0;
	_ctrl ctrlSetEventHandler['ButtonClick','_txt = typeOf vehicle player;((findDisplay -1341) displayCtrl 1339) ctrlSetText _txt;diag_log _txt;true'];

	_buttonYpos = _buttonYpos + _buttonheight;
	_ctrlid = _ctrlid + 1;
	_ctrl = [_display,'RSCButton',_ctrlid] call fnc_createctrl;
	_ctrl ctrlSetText 'GETPOS';
	_ctrl ctrlSetPosition [1,_buttonYpos,0.25,_buttonheight];
	_ctrl ctrlCommit 0;
	_ctrl ctrlSetEventHandler['ButtonClick','_txt = str(getPos player);((findDisplay -1341) displayCtrl 1339) ctrlSetText _txt;diag_log _txt;true'];

	_buttonYpos = _buttonYpos + _buttonheight;
	_ctrlid = _ctrlid + 1;
	_ctrl = [_display,'RSCButton',_ctrlid] call fnc_createctrl;
	_ctrl ctrlSetText 'GETPOSATL';
	_ctrl ctrlSetPosition [1,_buttonYpos,0.25,_buttonheight];
	_ctrl ctrlCommit 0;
	_ctrl ctrlSetEventHandler['ButtonClick','_txt = str(getPosATL player);((findDisplay -1341) displayCtrl 1339) ctrlSetText _txt;diag_log _txt;true'];

	_buttonYpos = _buttonYpos + _buttonheight + _buttonheight;
	_ctrlid = _ctrlid + 1;
	_ctrl = [_display,'RSCEdit',_ctrlid] call fnc_createctrl;
	_ctrl ctrlSetText (['infiSTAR_show_function_000','TYPE FUNCTION'] call fnc_getPNS);
	_ctrl ctrlSetPosition [1,_buttonYpos,0.25,_buttonheight];
	_ctrl ctrlSetBackgroundColor [0,0,0,0.6];
	_ctrl ctrlCommit 0;

	_buttonYpos = _buttonYpos + _buttonheight;
	_ctrlid = _ctrlid + 1;
	_ctrl = [_display,'RSCButton',_ctrlid] call fnc_createctrl;
	_ctrl ctrlSetText 'RETURN FUNCTION VALUE';
	_ctrl ctrlSetPosition [1,_buttonYpos,0.25,_buttonheight];
	_ctrl ctrlCommit 0;
	_ctrl ctrlSetEventHandler['ButtonClick','
		disableSerialization;
		_display = findDisplay -1341;
		_ctrl = _display displayCtrl 1339;
		
		_ctrltext = ctrlText(_display displayCtrl '+str (_ctrlid - 1)+');
		
		[''infiSTAR_show_function_000'',_ctrltext] call fnc_setPNS;
		
		_var = missionNameSpace getVariable [_ctrltext,''''];
		if(typeName _var isEqualTo ''CODE'')exitWith
		{
			_txt = str([] call _var);
			if(_txt isEqualTo '''')then{_txt = ''nothing to return'';};
			_ctrl ctrlSetText _txt;
			diag_log _txt;
			true
		};
		
		_function = _ctrltext call fnc_admin_ccc;
		_txt = '''';
		if(typeName _function isEqualTo ''CODE'')then
		{
			_txt = str([] call _function);
			if(_txt isEqualTo '''')then{_txt = ''nothing to return'';};
		}
		else
		{
			_txt = ''not a function.. (a function is something within curly brackets)'';
		};
		_ctrl ctrlSetText _txt;
		diag_log _txt;
		true
	'];

	_buttonYpos = _buttonYpos + _buttonheight + _buttonheight;
	_ctrlid = _ctrlid + 1;
	_ctrl = [_display,'RSCEdit',_ctrlid] call fnc_createctrl;
	_ctrl ctrlSetText (['infiSTAR_show_variable_000','READ FROM VARIABLE'] call fnc_getPNS);
	_ctrl ctrlSetPosition [1,_buttonYpos,0.25,_buttonheight];
	_ctrl ctrlSetBackgroundColor [0,0,0,0.6];
	_ctrl ctrlCommit 0;

	_buttonYpos = _buttonYpos + _buttonheight;
	_ctrlid = _ctrlid + 1;
	_ctrl = [_display,'RSCButton',_ctrlid] call fnc_createctrl;
	_ctrl ctrlSetText 'READ FROM VARIABLE';
	_ctrl ctrlSetPosition [1,_buttonYpos,0.25,_buttonheight];
	_ctrl ctrlCommit 0;
	_ctrl ctrlSetEventHandler['ButtonClick','
		disableSerialization;
		_display = findDisplay -1341;
		_ctrl = _display displayCtrl 1339;
		_ctrltext = ctrlText(_display displayCtrl '+str (_ctrlid - 1)+');
		
		[''infiSTAR_show_variable_000'',_ctrltext] call fnc_setPNS;
		
		_var = missionNameSpace getVariable [_ctrltext,''''];
		_txt = str _var;
		_ctrl ctrlSetText _txt;
		diag_log _txt;
		true
	'];


	_ctrlid = _ctrlid + 1;
	_ctrl = [_display,'RSCButton',_ctrlid] call fnc_createctrl;
	_ctrl ctrlSetText 'Debug Console';
	_ctrl ctrlSetPosition [1,_startYpos + 0.8,0.25,_buttonheight];
	_ctrl ctrlCommit 0;
	_ctrl ctrlSetEventHandler['ButtonClick','[] spawn fnc_RscDisplayDebugPublic;true'];



	_ctrlid = _ctrlid + 1;
	_ctrl = [_display,'RSCButton',_ctrlid] call fnc_createctrl;
	_ctrl ctrlSetText 'CLOSE';
	_ctrl ctrlSetPosition [1,_startYpos + 1,0.25,_buttonheight];
	_ctrl ctrlCommit 0;
	_ctrl ctrlSetEventHandler['ButtonClick','closeDialog 0;true'];






	_ctrl = [_display,'RSCEdit',1] call fnc_createctrl;
	_ctrl ctrlSetPosition [-0.25,1 + (_buttonheight*2),0.25,_buttonheight];
	_ctrl ctrlSetBackgroundColor [0,0,0,0.6];
	_ctrl ctrlCommit 0;


	_ctrl = [_display,'RSCButton',2] call fnc_createctrl;
	_ctrl ctrlSetText 'Save';
	_ctrl ctrlSetPosition [-0.25,1 + (_buttonheight*3),0.25,_buttonheight];
	_ctrl ctrlCommit 0;
	_ctrl ctrlSetEventHandler['ButtonClick','
		_varname = ctrlText((findDisplay -1341) displayCtrl 1);
		if(_varname isEqualTo '''')then
		{
			systemChat ''You need to write a name to save this function..!'';
		}
		else
		{
			_var = [''infiSTAR_SAVED_FUNCTIONS'',[]] call fnc_getPNS;
			_index = _var pushBackUnique _varname;
			
			
			[''infiSTAR_SAVED_FUNCTIONS'',_var] call fnc_setPNS;
			[format[''infiSTAR_SAVED_FUNCTION_%1'',_varname],ctrlText((findDisplay -1341) displayCtrl 1339)] call fnc_setPNS;
			
			systemChat format[''Saved: %1'',_varname];
			call fnc_fillDebugListBox;
		};
	true
	'];
	
	_ctrl = [_display,'RSCButton',3] call fnc_createctrl;
	_ctrl ctrlSetText 'Load';
	_ctrl ctrlSetPosition [-0.25,1 + (_buttonheight*4),0.25,_buttonheight];
	_ctrl ctrlCommit 0;
	_ctrl ctrlSetEventHandler['ButtonClick','
		_var = [''infiSTAR_SAVED_FUNCTIONS'',[]] call fnc_getPNS;
		_varname = lbtext[1384,(lbCurSel 1384)];
		if(_varname isEqualTo '''')then
		{
			systemChat ''You need to select a function to load it..!'';
		}
		else
		{
			_index = _var find _varname;
			
			_varvalue = [format[''infiSTAR_SAVED_FUNCTION_%1'',_varname],''''] call fnc_getPNS;
			((findDisplay -1341) displayCtrl 1339) ctrlSetText _varvalue;
			
			systemChat format[''Loaded: %1'',_varname];
			call fnc_fillDebugListBox;
		};
	true
	'];

	_ctrl = [_display,'RSCButton',4] call fnc_createctrl;
	_ctrl ctrlSetText 'Delete';
	_ctrl ctrlSetPosition [-0.25,1 + (_buttonheight*5),0.25,_buttonheight];
	_ctrl ctrlCommit 0;
	_ctrl ctrlSetEventHandler['ButtonClick','
		_var = [''infiSTAR_SAVED_FUNCTIONS'',[]] call fnc_getPNS;
		_varname = lbtext[1384,(lbCurSel 1384)];
		if(_varname isEqualTo '''')then
		{
			systemChat ''You need to select a function to delete..!'';
		}
		else
		{
			_index = _var find _varname;
			
			_var deleteAt _index;
			[''infiSTAR_SAVED_FUNCTIONS'',_var] call fnc_setPNS;
			[format[''infiSTAR_SAVED_FUNCTION_%1'',_varname],nil] call fnc_setPNS;
			
			systemChat format[''Deleted: %1'',_varname];
			call fnc_fillDebugListBox;
		};
	true
	'];

	call fnc_fillDebugListBox;
};