[] spawn {
pos1 = [getPos flagpole_blu select 0, getPos flagpole_blu select 1,1];
_light1 = "#lightpoint" createVehicle pos1;
_light1 setLightBrightness 1.0;
_light1 setLightAmbient [1.0, 1.0, 1.0];
_light1 setLightColor [1.0, 1.0, 1.0];
_light1 lightAttachObject [flagpole_blu,[0,0,5]];

pos2 = [getPos flagpole_red select 0, getPos flagpole_red select 1,1];
_light2 = "#lightpoint" createVehicle pos2;
_light2 setLightBrightness 1.0;
_light2 setLightAmbient [1.0, 1.0, 1.0];
_light2 setLightColor [1.0, 1.0, 1.0];
_light2 lightAttachObject [flagpole_red,[0,0,5]];

pos3 = [getPos flagpole_ind select 0, getPos flagpole_ind select 1,1];
_light3 = "#lightpoint" createVehicle pos3;
_light3 setLightBrightness 1.0;
_light3 setLightAmbient [1.0, 1.0, 1.0];
_light3 setLightColor [1.0, 1.0, 1.0];
_light3 lightAttachObject [flagpole_ind,[0,0,5]];
};
