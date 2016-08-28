waitUntil {!isNull player && player == player};
if(player diarySubjectExists "rules")exitwith{};

player createDiarySubject ["afc","Austrian-Funclan"];
player createDiarySubject ["koth","King of the Hill"];


/*  Example
	player createDiaryRecord ["", //Container
		[
			"", //Subsection
				"
				TEXT HERE<br/><br/>
				"
		]
	];
*/
	player createDiaryRecord ["afc",
		[
			"Credits",
				"
				Special thanks goes to<br/><br/>
				
				Altis Army<br/>		
				for making this mod<br/><br/>
				
				itsatrap aka Ninja<br/>
				for the extDB changes<br/><br/>
				
				Soolie<br/>
				for the tradermenu<br/><br/>
				"
		]
	];

	player createDiaryRecord ["afc",
		[
			"Donations",
				"
				Donations keep the server running, anything and everything helps.<br/><br/>
				Paypal: donate@austrian-funclan.com<br/><br/>
				"
		]
	];
	player createDiaryRecord ["afc",
		[
			"Website/Forums",
				"
				<img image='images\afc_logo.paa' width='300' height='74'/><br/><br/>
				http://www.austrian-funclan.com<br/>
				"
		]
	];
	player createDiaryRecord ["koth",
		[
			"Controls", 
				"
				1 - primary Weapon<br/>
				2 - secondary Weapon<br/>
				3 - Rocket Launcher<br/>
				5 - Earplugs in/out<br/>
				H - holster/unholster Weapon<br/>
				U - Groupmanagement<br/>
				V (when running) - jump<br/>
				insert - switch Killticker on/off<br/>
				"
		]
	];
	player createDiaryRecord ["koth",
		[
			"Changelog", 
				"
				Scoreboard disabled - what counts are the tickets shown in the hud<br/>
				Throwing grenades/chemlights disabled in Bases<br/><br/>
				
				Location specific stuff is loaded now serverside<br/><br/>
				
				4-five added due to player request<br/>
				Apex Weapons and vehicles added<br/><br/>
				
				Teambalance added<br/><br/>
				
				Database reset - full player wipe due to the new XP system<br/>
				Scoreboard removed<br/>
				dynamic XP for kills - lowered XP for kills outside the zone<br/>
				new tradermenu implemented - thanks again to Soolie<br/><br/>
				
				get extra XP for destroying an enemy Spawntruck<br/>
				Earplug function changed (5)<br/>
				Groupmanagement changed (U)<br/>
				Arma2Net DB connection changed to extDB - no more endless waiting for your rank and loadout - thanks again to itsatrap aka Ninja<br/><br/>
				
				Show remaining time until destroyed Spawntruck will respawn<br/>
				Backpack protection added - no more stealing items<br/><br/>
				
				HMG Vehicles removed<br/>
				Chatfunction disabled completely (except groupchat)<br/><br/>

				Option to switch Killticker on and off (ins)<br/>
				Show remaining time of Cooldown<br/>
				Vehicles driven into enemy bases will be destroyed<br/>
				Voice over Network limited to direct and group channels<br/>
				drowned Spawntrucks in deep water will be destroyed so they can respawn<br/>
				Playercount shown in HUD under the Tickets<br/>
				Stats will be saved when the round ends<br/>
				Fast Weapon Switch with keys 1, 2 and 3 for primary, secondary and launcher<br/>
				AFK Players will be warned after 5 Minutes and kicked after 2 more Minutes<br/>
				Weapons disabled in Bases<br/>
				Automated Day and Night Cycle<br/>
				"
		]
	];
	player createDiaryRecord ["koth",
		[
			"Serverrules", 
				"
				By playing on this server you agree to these rules<br/>
				if you dont like them go and search another server<br/><br/>

				No kamikaze - no voice on global - no excessive shooting in base<br/>
				Play the objective: no baseraping - no teamkilling/damaging/stealing of friendly vehicles<br/>
				Camping near the main roads is baseraping! camping the spawntruck is not allowed!<br/>
				Follow the rules without discussion - you will only be warned once<br/>
				"
		]
	];
	player createDiaryRecord ["koth",
		[
			"Information", 
				"
				Objective: capture and hold the Objective with your team<br/>
				You capture the zone if you are inside it<br/>
				You get xp for kills and for staying near the objective<br/>
				Your team will capture the zone faster when you are inside the inner (black) area<br/>
				The team with the highest ticket count wins<br/>
				Buy weapons and vehicles in your base - use spawntruck to teleport to the frontier (flag in base)<br/>
				When a new round starts give the server some time to load your rank it can take a moment<br/>
				Do NOT save your stats manually when your rank was not loaded correctly or it will be gone for good<br/>
				"
		]
	];
