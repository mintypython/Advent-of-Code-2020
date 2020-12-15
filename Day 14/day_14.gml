function day_14_part_1(){
	var instructions = string_split(read("input.txt"), "\n");
	
	var bitmask = new d14p1_bitmask();
	
	for (var i = 0; i < array_length(instructions); i++) {
		bitmask.command(instructions[i]);
	}
	
	var sum = 0;
	for (var i = 0; i < array_length(bitmask.memory); i++) {
		sum += bitmask.memory[i];
	}
	show_debug_message(sum);
}

function day_14_part_2(){
	var instructions = string_split(read("input.txt"), "\n");
	
	var bitmask = new d14p2_bitmask();
	
	for (var i = 0; i < array_length(instructions); i++) {
		bitmask.command(instructions[i]);
	}
	
	var sum = 0;
	show_debug_message(ds_map_size(bitmask.memory));
	var keys = ds_map_keys_to_array(bitmask.memory);
	show_debug_message(array_length(keys));
	for (var i = 0; i < array_length(keys); i++) {
		sum += bitmask.memory[? keys[i]];
	}
	show_debug_message(sum);
	ds_map_destroy(bitmask.memory);
}

function d14p1_bitmask() constructor {
	mask = 0;
	memory = [];
	
	command = function(str) {
		var sides = string_split_trim(str, "=");
		if (string_copy(sides[0], 1, 3) == "mem") {
			var start = string_pos("[", sides[0]) + 1;
			var len = string_pos("]", sides[0]) - start;
			var address = real(string_copy(sides[0], start, len));
			memory[address] = applyMask(~~real(sides[1]));
		}
		else {
			mask = sides[1];
		}
	}
	
	applyMask = function(num) {
		for (var i = 1; i <= string_length(mask); i++) {
			var char = string_char_at(mask, i);
			var digit = string_length(mask) - i;
			if (char == "0") {
				num &= ~(1 << digit);
			}
			else if (char == "1") {
				num |= 1 << digit;
			}
		}
		return num;
	}
}

function d14p2_bitmask() constructor {
	mask = 0;
	unknowns = [];
	memory = ds_map_create();
	
	command = function(str) {
		var sides = string_split_trim(str, "=");
		var command = sides[0];
		var value = real(sides[1]);
		if (string_copy(command, 1, 3) == "mem") {
			var start = string_pos("[", command) + 1;
			var len = string_pos("]", command) - start;
			var address = applyMask(~~real(string_copy(command, start, len)), mask);
			
			//show_debug_message(address);
			
			for (var i = 0; i < (1 << array_length(unknowns)); i++) {
				var pos = address;
				for (var j =  0; j < array_length(unknowns); j++) {
					pos |= ((i div (1 << j)) % 2) << unknowns[j];
				}
				
				memory[? pos] = value;
			}
		}
		else {
			mask = sides[1];
			unknowns = [];
			for (var i = 1; i <= string_length(mask); i++) {
				var char = string_char_at(mask, i);
				if (char == "X")
					unknowns[array_length(unknowns)] = string_length(mask) - i;
			}
		}
	}
	
	applyMask = function(num, mask) {
		var res = 0;
		for (var i = 1; i <= string_length(mask); i++) {
			var char = string_char_at(mask, i);
			if (char == "1")
				res |= 1 << (string_length(mask) - i);
			else if (char == "0")
				res |= num & (1 << (string_length(mask) - i));
		}
		return res;
	}
}