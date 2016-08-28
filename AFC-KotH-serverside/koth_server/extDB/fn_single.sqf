private["_parameters","_query","_result"];
_parameters = _this;

if (KOTH_DEBUG) then
{
    diag_log str _this;
};

_query = [0, (call extDB_koth_ID), _parameters] joinString ":";
_result = call compile ("extDB2" callExtension _query);
(_result select 1) select 0
