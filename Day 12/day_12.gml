function day_12_part_1(){
	var instructions = string_split(read("input.txt"), "\n");
	var ship = new d12p1_Ship(0, 0, 0);
	for (var i = 0; i < array_length(instructions); i++) {
		var command = string_char_at(instructions[i], 1);
		var units = real(string_delete(instructions[i], 1, 1));
		
		switch(command) {
			case "N":
				ship.north(units);
				break;
			case "S":
				ship.south(units);
				break;
			case "E":
				ship.east(units);
				break;
			case "W":
				ship.west(units);
				break;
			case "L":
				ship.left(units);
				break;
			case "R":
				ship.right(units);
				break;
			case "F":
				ship.forward(units);
				break;
		}
	}
	
	show_debug_message("DIST: " + string(abs(ship.pos.x) + abs(ship.pos.y)));
}

function day_12_part_2(){
	var instructions = string_split(read("input.txt"), "\n");
	var ship = new d12p2_Ship(10, -1);
	for (var i = 0; i < array_length(instructions); i++) {
		var command = string_char_at(instructions[i], 1);
		var units = real(string_delete(instructions[i], 1, 1));
		
		switch(command) {
			case "N":
				ship.north(units);
				break;
			case "S":
				ship.south(units);
				break;
			case "E":
				ship.east(units);
				break;
			case "W":
				ship.west(units);
				break;
			case "L":
				ship.left(units);
				break;
			case "R":
				ship.right(units);
				break;
			case "F":
				ship.forward(units);
				break;
		}
	}
	
	show_debug_message("DIST: " + string(abs(ship.pos.x) + abs(ship.pos.y)));
}

function instruct_ship(ship, instruction) {
}

function d12p1_Ship(_x, _y, _dir) constructor {
	pos = {x:0, y:0};
	dir = _dir;
	
	east = function(units) {
		pos.x += units;
	}
	
	north = function(units) {
		pos.y -= units;
	}
	
	west = function(units) {
		pos.x -= units;
	}
	
	south = function(units) {
		pos.y += units;
	}
	
	right = function(degrees) {
		dir -= degrees;
	}
	
	left = function(degrees) {
		dir += degrees;
	}
	
	forward = function(units) {
		pos.x += lengthdir_x(units, dir);
		pos.y += lengthdir_y(units, dir);
	}
}

function d12p2_Ship(_x, _y) constructor {
	pos = {x:0, y:0};
	waypoint = {x:_x, y:_y};
	
	east = function(units) {
		waypoint.x += units;
	}
	
	north = function(units) {
		waypoint.y -= units;
	}
	
	west = function(units) {
		waypoint.x -= units;
	}
	
	south = function(units) {
		waypoint.y += units;
	}
	
	right = function(degrees) {
		repeat (degrees / 90) {
			var temp = waypoint.x;
			waypoint.x = -waypoint.y;
			waypoint.y = temp;
		}
	}
	
	left = function(degrees) {
		repeat (degrees / 90) {
			var temp = waypoint.x;
			waypoint.x = waypoint.y;
			waypoint.y = -temp;
		}
	}
	
	forward = function(units) {
		repeat(units) {
			pos.x += waypoint.x;
			pos.y += waypoint.y;
		}
	}
}