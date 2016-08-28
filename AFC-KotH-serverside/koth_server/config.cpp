/*
	Author: AFC~Gagi2~
	Contact: gagi2@austrian-funclan.com
*/
class CfgPatches {
	class koth_server {
		units[] = {};
		weapons[] = {};
		koth_server = 0.1;
		requiredVersion = 1.36;
		requiredAddons[] = {};
	};
};
class CfgFunctions {
	class koth_server
	{
		class main {
			file = "koth_server";
			class preInit {
				preInit = 1;
			};
		};
	};
};