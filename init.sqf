while {true} do {
    {
        if (markerShape _x == 'POLYLinE') then {
            _name = _x splitstring "#";
            _name = _name joinstring "";
			//_newPos = [];
			//for "_i" from 0 to (count (markerPolyline _x)) do {
			//	if(_i%2 != 0)then{
			//		_temp = worldSize - ((markerPolyline _x) select _i);
			//		_newPos pushback _temp;
			//	};
			//	_newPos pushback ((markerPolyline _x) select _i);
			//};
            //_position = (_newPos) joinstring ", ";
			_position = (markerPolyline _x) joinstring ", ";
            _shape = markerShape _x;
            [_name, _position, _shape] remoteExec ["DB_fnc_markers", 2];
        } else {
            _name = _x splitstring "#";
            _name = _name joinstring "";
            _position = markerPos _x;
            _shape = markerShape _x;
            _text = markertext _x;
            _color = markerColor _x;
            _type = markertype _x;
            [_name, _position, _shape, _text, _color, _type] remoteExec ["DB_fnc_markers", 2];
        }
    }forEach allMapMarkers;
    
    sleep 10;
};
//1
