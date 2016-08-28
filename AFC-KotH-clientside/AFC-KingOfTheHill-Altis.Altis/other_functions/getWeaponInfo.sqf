_item = _this;
_rank = 999;
_cfg = "";
	
	
	if (isClass (missionConfigFile >> "AFCcfgMain" >> "AFC_cfg_Traders" >> "Primaries" >> _item)) then
	{_cfg = "Primaries";} else
	{
	if (isClass (missionConfigFile >> "AFCcfgMain" >> "AFC_cfg_Traders" >> "Secondaries" >> _item)) then
	{_cfg = "Secondaries";} else
	{
	if (isClass (missionConfigFile >> "AFCcfgMain" >> "AFC_cfg_Traders" >> "Launchers" >> _item)) then	
	{_cfg = "Launchers";} else
	{
	if (isClass (missionConfigFile >> "AFCcfgMain" >> "AFC_cfg_Traders" >> "Backpacks" >> _item)) then
	{_cfg = "Backpacks";} else
	{
	if (isClass (missionConfigFile >> "AFCcfgMain" >> "AFC_cfg_Traders" >> "Attachments" >> _item)) then
	{_cfg = "Attachments";} else
	{
	if (isClass (missionConfigFile >> "AFCcfgMain" >> "AFC_cfg_Traders" >> "Vests" >> _item)) then
	{_cfg = "Vests";} else
	{
	if (isClass (missionConfigFile >> "AFCcfgMain" >> "AFC_cfg_Traders" >> "Uniforms" >> _item)) then
	{_cfg = "Uniforms";} else
	{
	if (isClass (missionConfigFile >> "AFCcfgMain" >> "AFC_cfg_Traders" >> "Headgear" >> _item)) then
	{_cfg = "Headgear";} else
	{
	if (isClass (missionConfigFile >> "AFCcfgMain" >> "AFC_cfg_Traders" >> "AssignedItems" >> _item)) then
	{_cfg = "Assigned Items";} else
	{
	if (isClass (missionConfigFile >> "AFCcfgMain" >> "AFC_cfg_Traders" >> "FlareItems" >> _item)) then
	{_cfg = "FlareItems";} else
	{
	if (isClass (missionConfigFile >> "AFCcfgMain" >> "AFC_cfg_Traders" >> "ExplosiveItems" >> _item)) then
	{_cfg = "ExplosiveItems";} else
	{
	if (isClass (missionConfigFile >> "AFCcfgMain" >> "AFC_cfg_Traders" >> "SupportItems" >> _item)) then
	{_cfg = "SupportItems";} else
	{
	if (isClass (missionConfigFile >> "AFCcfgMain" >> "AFC_cfg_Traders" >> "Glasses" >> _item)) then
	{_cfg = "Glasses";} else
	{
	if (isClass (missionConfigFile >> "AFCcfgMain" >> "AFC_cfg_Traders" >> "Faces" >> _item)) then
	{_cfg = "Faces";};};};};};};};};};};};};};};
	
	_rank = getNumber(missionConfigFile >> "AFCcfgMain" >> "AFC_cfg_Traders" >> _cfg >> _item >> "rank");
	_output = [_rank,_cfg];
	_output