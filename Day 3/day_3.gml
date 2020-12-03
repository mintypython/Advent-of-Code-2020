function day_3_part_1(){
	var lines = string_split(read("input.txt"), "\n");
	show_debug_message(toboggan(lines, 3, 1));
}

function day_3_part_2(){
	var lines = string_split(read("input.txt"), "\n");
	show_debug_message(toboggan(lines, 1, 1) * toboggan(lines, 3, 1) * toboggan(lines, 5, 1) * toboggan(lines, 7, 1) * toboggan(lines, 1, 2));
}

function toboggan(array, run, rise) {
	var width = string_length(array[0]) - 1;
	var trees = 0;
	for (var row = 0, column = 0; row < array_length(array); row += rise) {
		if (string_char_at(array[row], column + 1) == "#") {
			trees++;
		}
		column = (column + run) % width;
	}
	return trees;
}