function day_2_part_1(){
	var input = string_split(read("input.txt"), "\n");
	
	var total = 0;
	for (var i = 0; i < array_length(input); i++){
		var line = input[i];
		
		var pos;
		
		pos = string_pos(" ", line);
		var minmax = string_split_reals(string_copy(line, 1, pos - 1), "-");
		
		line = string_delete(line, 1, pos);
		
		var char = string_char_at(line, 1);
		
		line = string_delete(line, 1, 3);
		
		var count = string_count(char, line);
		if (count >= minmax[0] && count <= minmax[1]) {
			total++;
		}
	}
	show_debug_message(total);
}

function day_2_part_2(){
	var input = string_split(read("input.txt"), "\n");
	
	var total = 0;
	for (var i = 0; i < array_length(input); i++){
		var line = input[i];
		
		var pos;
		
		pos = string_pos(" ", line);
		var minmax = string_split_reals(string_copy(line, 1, pos - 1), "-");
		
		line = string_delete(line, 1, pos);
		
		var char = string_char_at(line, 1);
		
		line = string_delete(line, 1, 3);
		
		if ((string_char_at(line, minmax[0]) == char) ^^ (string_char_at(line, minmax[1]) == char)) {
			total++;
		}
	}
	show_debug_message(total);
}