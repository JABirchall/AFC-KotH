if (side player == west) then
{
	createMarkerLocal ["spawntruck_marker_blu", [0,0]];
	"spawntruck_marker_blu" setMarkerTypeLocal "mil_dot";
	"spawntruck_marker_blu" setMarkerColorLocal "ColorBLUFOR";
	"spawntruck_marker_blu" setMarkerTextLocal "Spawntruck";
	
	while {true} do
	{
		sleep 5;
		
		if(typeName spawntruck_blu == "OBJECT") then 
		{
			"spawntruck_marker_blu" setMarkerAlphaLocal 1;
			"spawntruck_marker_blu" setMarkerPosLocal [(getPos spawntruck_blu) select 0, (getPos spawntruck_blu) select 1];
		} else
		{
			"spawntruck_marker_blu" setMarkerAlphaLocal 0;
		};
	};
};

if (side player == east) then
{
	createMarkerLocal ["spawntruck_marker_red", [0,0]];
	"spawntruck_marker_red" setMarkerTypeLocal "mil_dot";
	"spawntruck_marker_red" setMarkerColorLocal "ColorOPFOR";
	"spawntruck_marker_red" setMarkerTextLocal "Spawntruck";
	
	while {true} do
	{
		sleep 5;
		
		if(typeName spawntruck_red == "OBJECT") then 
		{
			"spawntruck_marker_red" setMarkerAlphaLocal 1;
			"spawntruck_marker_red" setMarkerPosLocal [(getPos spawntruck_red) select 0, (getPos spawntruck_red) select 1];
		} else
		{
			"spawntruck_marker_red" setMarkerAlphaLocal 0;
		};
	};
};

if (side player == resistance) then
{
	createMarkerLocal ["spawntruck_marker_ind", [0,0]];
	"spawntruck_marker_ind" setMarkerTypeLocal "mil_dot";
	"spawntruck_marker_ind" setMarkerColorLocal "ColorIndependent";
	"spawntruck_marker_ind" setMarkerTextLocal "Spawntruck";
	
	while {true} do
	{
		sleep 5;
		
		if(typeName spawntruck_ind == "OBJECT") then 
		{
			"spawntruck_marker_ind" setMarkerAlphaLocal 1;
			"spawntruck_marker_ind" setMarkerPosLocal [(getPos spawntruck_ind) select 0, (getPos spawntruck_ind) select 1];
		} else
		{
			"spawntruck_marker_ind" setMarkerAlphaLocal 0;
		};
	};
};

if (str player == "spectator") then
{
	createMarkerLocal ["spawntruck_marker_blu", [0,0]];
	"spawntruck_marker_blu" setMarkerTypeLocal "mil_dot";
	"spawntruck_marker_blu" setMarkerColorLocal "ColorBLUFOR";
	"spawntruck_marker_blu" setMarkerTextLocal "Spawntruck";
	
	createMarkerLocal ["spawntruck_marker_red", [0,0]];
	"spawntruck_marker_red" setMarkerTypeLocal "mil_dot";
	"spawntruck_marker_red" setMarkerColorLocal "ColorOPFOR";
	"spawntruck_marker_red" setMarkerTextLocal "Spawntruck";
	
	createMarkerLocal ["spawntruck_marker_ind", [0,0]];
	"spawntruck_marker_ind" setMarkerTypeLocal "mil_dot";
	"spawntruck_marker_ind" setMarkerColorLocal "ColorIndependent";
	"spawntruck_marker_ind" setMarkerTextLocal "Spawntruck";
	
	while {true} do
	{
		sleep 5;
		
		if(typeName spawntruck_blu == "OBJECT") then 
		{
			"spawntruck_marker_blu" setMarkerAlphaLocal 1;
			"spawntruck_marker_blu" setMarkerPosLocal [(getPos spawntruck_blu) select 0, (getPos spawntruck_blu) select 1];
		} else
		{
			"spawntruck_marker_blu" setMarkerAlphaLocal 0;
		};
		
		if(typeName spawntruck_red == "OBJECT") then 
		{
			"spawntruck_marker_red" setMarkerAlphaLocal 1;
			"spawntruck_marker_red" setMarkerPosLocal [(getPos spawntruck_red) select 0, (getPos spawntruck_red) select 1];
		} else
		{
			"spawntruck_marker_red" setMarkerAlphaLocal 0;
		};
		
		if(typeName spawntruck_ind == "OBJECT") then 
		{
			"spawntruck_marker_ind" setMarkerAlphaLocal 1;
			"spawntruck_marker_ind" setMarkerPosLocal [(getPos spawntruck_ind) select 0, (getPos spawntruck_ind) select 1];
		} else
		{
			"spawntruck_marker_ind" setMarkerAlphaLocal 0;
		};
	};
};