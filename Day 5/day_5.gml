function day_5_part_1() {
	var text = read("input.txt");
	var lines = string_split(text, "\n");
	
	var maxID = 0;
	for (var i = 0; i < array_length(lines); i++) {
		maxID = max(maxID, calcSeatID(lines[i]));
	}
	show_debug_message(maxID);
}

function day_5_part_2() {
	var text = read("input.txt");
	var lines = string_split(text, "\n");
	
	var maxID = 0;
	var minID = 1000;
	var ids = ds_list_create();
	for (var i = 0; i < array_length(lines); i++) {
		var seatID = calcSeatID(lines[i]);
		ds_list_add(ids, seatID);
		minID = min(minID, seatID);
		maxID = max(maxID, seatID);
	}
	
	show_debug_message(findMissingID(ids, minID, maxID));
}

function calcSeatID(str) {
	
	// calc row
	var row = 0;
	for (var i = 1; i <= 7; i++) {
		if (string_char_at(str, i) == "B") {
			row += 1 << (7 - i);
		}
	}
	
	// calc column
	var column = 0;
	for (var i = 8; i <= 10; i++) {
		if (string_char_at(str, i) == "R") {
			column += 1 << (3 - (i - 7));
		}
	}
	
	return row * 8 + column;
}

function findMissingID(_list, _min, _max) {
	for (var i = _min; i <= _max; i++) {
		if (ds_list_find_index(_list, i) == -1){
			return i;
		}
	}
}