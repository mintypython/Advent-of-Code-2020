function day_6_part_1(){
	var lines = string_split(read("input.txt"), "\n");
	
	var total = 0;
	var answers = ds_list_create();
	for (var i = 0; i < array_length(lines); i++) {
		var line = lines[i];
		if (line == "") {
			ds_list_clear(answers);
		}
		else {
			for (var j = 1; j <= string_length(line); j++) {
				var char = string_char_at(line, j);
				if (ds_list_find_index(answers, char) == -1) {
					total += 1;
					ds_list_add(answers, char);
				}
			}
		}
	}
	show_debug_message(total);
}

function day_6_part_2(){
	var lines = string_split(read("input.txt"), "\n");
	
	var newline = true;
	var total = 0;
	var answers = ds_list_create();
	for (var i = 0; i < array_length(lines); i++) {
		var line = lines[i];
		if (line == "") {
			total += ds_list_size(answers);
			newline = true;
			ds_list_clear(answers);
		}
		else {
			if (newline) {
				newline = false;
				for (var j = 1; j <= string_length(line); j++) {
					ds_list_add(answers, string_char_at(line, j));
				}
			}
			else {
				for (var j = 0; j < ds_list_size(answers); j++) {
					if (string_pos(answers[| j], line) <= 0)
						ds_list_delete(answers, j--);
				}
			}
		}
	}
	
	total += ds_list_size(answers);
	show_debug_message(total);
}