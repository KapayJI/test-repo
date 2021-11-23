player = _this select 0;

//_i = 100;
//_k = 0;
 
 
protocol = ceil random 9999;
db_name = "u1011519_arma3userscoors";    
_result = "Extdb3" callExtension format["9:ADD_DATABASE_PROTOCOL:%1:SQL:%2:TEXT",db_name, protocol];    
if (!(_result isEqualTo "[1]")) then {    
  diag_log "extDB3: 2 Ошибка соединения с базой данных";    
}    
else{    
 diag_log format ["extDB3: 2 Соединено ---- %1",_result];    
}; 

_start_coords_write = {
	//for [{private _i = 0}, {_i < 1000}, {_i = _i + 1}] do {
	while{true} do {
			_result ="extDB3" callExtension format["0:SQL:UPDATE PLAYERSCOORDS SET coord_x='%1', coord_y='%2' WHERE name='%3'", (getPos player) select 0, (getPos player) select 1, name player];
		diag_log _result;
		sleep 1;
	};
};
sleep 20;
_result = "extDB3" callExtension format["0:SQL:SELECT * FROM PLAYERSCOORDS WHERE name='%1'",name player];
diag_log _result;
if((name player) in _result)then{
	[] spawn _start_coords_write;
}else{
	_result = "extDB3" callExtension format["0:SQL:INSERT INTO PLAYERSCOORDS (name, side,coord_x,coord_y) VALUES ('%1','%2','%3','%4')",name player,side player, (getPos player) select 0, (getPos player) select 1];
	diag_log _result;
	
	[] spawn _start_coords_write;
};