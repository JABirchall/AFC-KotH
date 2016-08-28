_location = profileNamespace getVariable "location";
if(isNil "_location") then {_location = "kavala_altis";};

switch (_location) do { 
	case "kavala_altis": {[] execVM "koth_server\objectives\kavala_altis.sqf"; _location = "sofia_altis"; profileNamespace setVariable ["location",_location]; saveProfileNamespace;}; 
	case "sofia_altis": {[] execVM "koth_server\objectives\sofia_altis.sqf"; _location = "chalkeia_altis"; profileNamespace setVariable ["location",_location]; saveProfileNamespace;}; 
	case "chalkeia_altis": {[] execVM "koth_server\objectives\chalkeia_altis.sqf"; _location = "zaros_altis"; profileNamespace setVariable ["location",_location]; saveProfileNamespace;}; 
	case "zaros_altis": {[] execVM "koth_server\objectives\zaros_altis.sqf"; _location = "airport_altis"; profileNamespace setVariable ["location",_location]; saveProfileNamespace;}; 
	case "airport_altis": {[] execVM "koth_server\objectives\airport_altis.sqf"; _location = "southernruins_altis"; profileNamespace setVariable ["location",_location]; saveProfileNamespace;}; 
	case "southernruins_altis": {[] execVM "koth_server\objectives\southernruins_altis.sqf"; _location = "athira_altis"; profileNamespace setVariable ["location",_location]; saveProfileNamespace;}; 
	case "athira_altis": {[] execVM "koth_server\objectives\athira_altis.sqf"; _location = "pharmafactory_altis"; profileNamespace setVariable ["location",_location]; saveProfileNamespace;}; 
	case "pharmafactory_altis": {[] execVM "koth_server\objectives\pharmafactory_altis.sqf"; _location = "militarybase_altis"; profileNamespace setVariable ["location",_location]; saveProfileNamespace;}; 
	case "militarybase_altis": {[] execVM "koth_server\objectives\militarybase_altis.sqf"; _location = "kavala_altis"; profileNamespace setVariable ["location",_location]; saveProfileNamespace;}; 
	default {[] execVM "koth_server\objectives\kavala_altis.sqf"; _location = "sofia_altis"; profileNamespace setVariable ["location",_location]; saveProfileNamespace;}; 
};