params["_player"];

//_player remoteExec ["DB_fnc_blacklist",2,false];
sleep 2;
_player remoteExec ["DB_fnc_connected",2,false];
_player remoteExec ["DB_fnc_players",2,false];
