private["_parameters","_query"];
_parameters = _this;
_query = [1, (call extDB_koth_ID), _parameters] joinString ":";
"extDB2" callExtension _query;
true
