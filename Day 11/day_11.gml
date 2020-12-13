function day_11_part_1() {
	var t = get_timer();
	var rows = string_split(read("input.txt"), "\n");
	
	for (var i = 1; i < infinity; i++) {
		var temp = d11_p1_advance(rows);
		if (d11_equals(rows, temp)) {
			show_debug_message(
				"Total iterations: " + string(i) + "\n" +
				"Filled seats: " + string(d11_count(rows))
			);
			show_debug_message("Time: "  + string((get_timer() - t)/1000000) + " seconds");
			return;
		}
		rows = temp;
	}
}

function day_11_part_2() {
	var t = get_timer();
	var rows = string_split(read("input.txt"), "\n");
	
	for (var i = 1; i < infinity; i++) {
		var temp = d11_p2_advance(rows);
		if (d11_equals(rows, temp)) {
			show_debug_message(
				"Total iterations: " + string(i) + "\n" +
				"Filled seats: " + string(d11_count(rows))
			);
			show_debug_message("Time: "  + string((get_timer() - t)/1000000) + " seconds");
			return;
		}
		rows = temp;
	}
}

function d11_p1_advance(array) {
	var output = [];
	var width = string_length(array[0]);
	for (var _y = 0; _y < array_length(array); _y++) {
		output[_y] = "";
		for (var _x = 1; _x <= width; _x++) {
			var char = string_char_at(array[_y], _x);
			switch (char) {
				case "L":
					if (d11_find_adjacents(array, _x, _y) == 0) {
						output[_y] += "#";
					}
					else {
						output[_y] += "L";
					}
					break;
				case "#":
					if (d11_find_adjacents(array, _x, _y) >= 4) {
						output[_y] += "L";
					}
					else {
						output[_y] += "#";
					}
					break;
				case ".":
					output[_y] += ".";
			}
		}
	}
	return output;
}

function d11_p2_advance(array) {
	var output = [];
	var width = string_length(array[0]);
	for (var _y = 0; _y < array_length(array); _y++) {
		output[_y] = "";
		for (var _x = 1; _x <= width; _x++) {
			var char = string_char_at(array[_y], _x);
			switch (char) {
				case "L":
					if (d11_find_visibles(array, _x, _y) == 0) {
						output[_y] += "#";
					}
					else {
						output[_y] += "L";
					}
					break;
				case "#":
					if (d11_find_visibles(array, _x, _y) >= 5) {
						output[_y] += "L";
					}
					else {
						output[_y] += "#";
					}
					break;
				case ".":
					output[_y] += ".";
			}
		}
	}
	return output;
}

function d11_is_filled(array, _x, _y) {
	var width = string_length(array[0]);
	if (
		_y < 0 ||
		_y >= array_length(array) ||
		_x < 1 ||
		_x > width
	)
		return false;
		
	return string_char_at(array[_y], _x) == "#";
}

function d11_find_adjacents(array, _x, _y) {
	var adjacents = 0;
	adjacents += d11_is_filled(array, _x + 1, _y);
	adjacents += d11_is_filled(array, _x + 1, _y - 1);
	adjacents += d11_is_filled(array, _x	, _y - 1);
	adjacents += d11_is_filled(array, _x - 1, _y - 1);
	adjacents += d11_is_filled(array, _x - 1, _y	);
	adjacents += d11_is_filled(array, _x - 1, _y + 1);
	adjacents += d11_is_filled(array, _x	, _y + 1);
	adjacents += d11_is_filled(array, _x + 1, _y + 1);
	return adjacents;
}

function d11_is_filled_in_dir(array, _startx, _starty, _xdir, _ydir) {
	var width = string_length(array[0]);
	for (var i = 1; i < infinity; i++) {
		var _x = _startx + _xdir * i;
		var _y = _starty + _ydir * i;
		if (
			_y < 0 ||
			_y >= array_length(array) ||
			_x < 1 ||
			_x > width
		)
			return false;
			
		var char = string_char_at(array[_y], _x);
		if (char == "#") {
			return true;
		}
		else if (char == "L") {
			return false;
		}
	}
	return false;
}

function d11_find_visibles(array, _x, _y) {
	var adjacents = 0;
	adjacents += d11_is_filled_in_dir(array, _x, _y,  1,  0);
	adjacents += d11_is_filled_in_dir(array, _x, _y,  1,  1);
	adjacents += d11_is_filled_in_dir(array, _x, _y,  0,  1);
	adjacents += d11_is_filled_in_dir(array, _x, _y, -1,  1);
	adjacents += d11_is_filled_in_dir(array, _x, _y, -1,  0);
	adjacents += d11_is_filled_in_dir(array, _x, _y, -1, -1);
	adjacents += d11_is_filled_in_dir(array, _x, _y,  0, -1);
	adjacents += d11_is_filled_in_dir(array, _x, _y,  1, -1);
	return adjacents;
}

function d11_equals(array1, array2) {
	for (var i = 0; i < array_length(array1); i++) {
		if (array1[i] != array2[i]) return false;
	}
	return true;
}

function d11_count(array) {
	var total = 0;
	for (var i = 0; i < array_length(array); i++) {
		total += string_count("#", array[i]);
	}
	return total;
}