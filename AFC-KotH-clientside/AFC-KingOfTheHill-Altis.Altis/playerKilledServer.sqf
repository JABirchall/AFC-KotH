if (isServer) then 
{
	_unit = _this select 0;
	_killer = _this select 1;
	_playerUID	= getPlayerUID _killer;
	_data = format["selectPlayerStats:%1", _playerUID] call KOTH_fnc_single;
	_admin = _data select 3;
	_donator = _data select 4;
	_distance = _killer distance (getMarkerPos "objective_main");

	//only real kills
	if (isPlayer _unit && isPlayer _killer) then
	{
		//no selfkill
		if(_unit != _killer) then
		{
			if (_killer isKindOf "Man") then
			{
				//teamkill
				if ((faction _unit) != (faction _killer)) then
				{
					if (_distance <= 400) then
					{
						if (_donator == 0) then
						{
							player_stats_add = [70,1,0];
						};
						if (_donator == 1) then 
						{
							player_stats_add = [80,1,0];
						};
						if (_donator == 2) then
						{
							player_stats_add = [90,1,0];
						};						
						if ((_donator == 3) || (_admin > 0)) then
						{
							player_stats_add = [100,1,0];
						};
					};
					if (_distance > 400) then
					{
						player_stats_add = [20,1,0];
					};
					if (_distance > 800) then
					{
						player_stats_add = [0,1,0];
					};
					owner _killer publicVariableClient "player_stats_add";
					player_stats_add = [0,0,1];
					owner _unit publicVariableClient "player_stats_add";
				};
			}
			else //kill with vehicle
			{
				if (_donator == 0) then
				{
					player_stats_add = [50,1,0];
				};
				if (_donator == 1) then
				{
					player_stats_add = [60,1,0];
				};
				if (_donator == 2) then
				{
					player_stats_add = [70,1,0];
				};
				if ((_donator == 3) || (_admin > 0)) then
				{
					player_stats_add = [80,1,0];
				};
				_crew = crew _killer;
				{owner _x publicVariableClient "player_stats_add";} forEach _crew;
				player_stats_add = [0,0,1];
				owner _unit publicVariableClient "player_stats_add";
			};
		}
		else
		{
			player_stats_add = [0,0,1];
			owner _unit publicVariableClient "player_stats_add";
		};
	}; 
};