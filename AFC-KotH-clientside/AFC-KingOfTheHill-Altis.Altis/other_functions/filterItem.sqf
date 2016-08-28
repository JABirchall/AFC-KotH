_item = _this;
_ill = false;

_illegalWeapons = ["I_Carryall_oli_Eng","B_Carryall_ocamo_Eng","B_Kitbag_mcamo_Eng","MineDetector","SatchelCharge_Remote_Mag","DemoCharge_Remote_Mag","SLAMDirectionalMine_Wire_Mag","ATMine_Range_Mag",
"APERSTripMine_Wire_Mag","APERSMine_Range_Mag","APERSBoundingMine_Range_Mag"];

if (_item in _illegalWeapons) then
{
	_ill = true;
}
else
{
	_weaponInfo = _item call getWeaponInfo;
	_weaponRank = _weaponInfo select 0;

	_xp = player_stats select 0;
	_rankinfo = _xp call getRankInfo;
	_rank = _rankinfo select 0;

	if (_weaponRank == 999) then
	{
		_ill = false;
	}
	else
	{
		if (_rank < _weaponRank) then
		{
			_ill = true;
		};
	};
};
_ill
