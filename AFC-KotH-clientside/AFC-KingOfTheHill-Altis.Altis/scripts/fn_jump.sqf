if (isNull player) exitwith {} ;
if  (
	speed player > 5 &&
	player == vehicle player &&
	{isTouchingGround player} &&
	{stance player == "STAND"}) then
{
	csg_jumping = true;
	private["_height","_vel","_speed","_dir","_key_delay","_max_height"];
	_max_height = 2.3;
	_height = 6-((load player)*10);
	_vel = velocity player;
	_dir = direction player;
	_speed = 0.4;
	If (_height > _max_height) then
	{
		_height = _max_height
	};
	
	player setVelocity [(_vel select 0)+(sin _dir*_speed),(_vel select 1)+(cos _dir*_speed),(_vel select 2)+_height];
	[player, "AovrPercMrunSrasWrflDf"] call KOTH_fnc_switchMoveGlobal;
	uiSleep 1;
	csg_jumping = false;
};
