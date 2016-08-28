if(isServer) then
{
	_vehicle = _this;

	_deleted = 0;
	_timer = 0;
	
	while {_deleted == 0 && alive _vehicle} do
	{
		sleep 30;
		
		if ((count (crew _vehicle)) == 0) then
		{
			_timer = _timer + 30;
		}
		else
		{
			_timer = 0;
		};
		
		if (_timer >= 600) then 
		{
			if (alive _vehicle) then
			{
				deleteVehicle _vehicle;
				_deleted = 1;
			};
		};
	};
};