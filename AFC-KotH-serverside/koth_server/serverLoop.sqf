while {true} do
{
	if (restart_done) exitwith {};
	sleep 10;
	_allPlayers = playableUnits;
	_bluewin = bluewin;
	_redwin = redwin;
	_greenwin = greenwin;

	_bluCount = 0;
	_redCount = 0;
	_indCount = 0;
		
	_count = (count _allPlayers) -1;
	
	for "_i" from 0 to _count do 
	{
		_unit = _allPlayers select _i;
		if(isPlayer _unit) then
		{
		_distance = _unit distance (getMarkerPos "objective_main");
	
		if (_distance < 400 && _distance > 80) then
		{
			player_stats_add = [1,0,0];
			_unit = _unit;
			owner _unit publicVariableClient "player_stats_add";
			
			if(side _unit == west) then {
				_bluCount = _bluCount + 1;
				TICKETS_BLU = TICKETS_BLU + 0.1;
			};
			if(side _unit == east) then {
				_redCount = _redCount + 1;
				TICKETS_RED = TICKETS_RED + 0.1;
			};
			if(side _unit == resistance) then {
				_indCount = _indCount + 1;
				TICKETS_IND = TICKETS_IND + 0.1;
			};
			
		};
		
		if (_distance < 80) then
		{
			player_stats_add = [2,0,0];
			_unit = _unit;
			owner _unit publicVariableClient "player_stats_add";
			
			if(side _unit == west) then {
				_bluCount = _bluCount + 2;
				TICKETS_BLU = TICKETS_BLU + 0.1;
			};
			if(side _unit == east) then {
				_redCount = _redCount + 2;
				TICKETS_RED = TICKETS_RED + 0.1;
			};
			if(side _unit == resistance) then {
				_indCount = _indCount + 2;
				TICKETS_IND = TICKETS_IND + 0.1;
			};
		};
		};
	
	};
	
	if (_bluCount > _redCount && _bluCount > _indCount) then {
		TICKETS_BLU = TICKETS_BLU + 1;
		"OBJECTIVE" setMarkerColor "ColorBlue";
	}
	else
	{
		if (_redCount > _bluCount && _redCount > _indCount) then {
			TICKETS_RED = TICKETS_RED + 1;
			"OBJECTIVE" setMarkerColor "ColorRed";
		}
		else
		{
			if (_indCount > _bluCount && _indCount > _redCount) then {
				TICKETS_IND = TICKETS_IND + 1;
				"OBJECTIVE" setMarkerColor "ColorGreen";
			}
			else
			{
				"OBJECTIVE" setMarkerColor "ColorBlack";
			};
		};
	};

	if (_bluewin == 1) then {
		restart_done = true;
		"END1" call BIS_fnc_endMissionServer;
		};
	if (_redwin == 1) then {
		restart_done = true;
		"END2" call BIS_fnc_endMissionServer;
		};
	if (_greenwin == 1) then {
		restart_done = true;
		"END3" call BIS_fnc_endMissionServer;
		};
	
	publicVariable "TICKETS_BLU";
	publicVariable "TICKETS_RED";
	publicVariable "TICKETS_IND";
};