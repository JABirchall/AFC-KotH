diag_log str _this;

_stats = _this select 1;

_xp 	    = _stats select 0;
_kills 	    = _stats select 1;
_deaths     = _stats select 2;
_admin      = _stats select 3;
_donator    = _stats select 4;

player_prev_xp	= _xp;
player_stats 	= [_xp, _kills, _deaths];
player_info 	= [_admin, _donator];
diag_log format ["KOTH: XP: %1, Kill: %2, Death: %3 Admin: %4. DONATOR: %5",_xp ,_kills,_deaths,_admin,_donator];
player_loaded 	= true;
