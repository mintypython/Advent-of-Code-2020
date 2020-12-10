function day_10_part_1(){
	var numbers = string_split_reals("0\n" + read("input.txt"), "\n");
	array_sort(numbers, true);
	
	var ones = 0;
	var threes = 0;
	
	for (var i = 1; i < array_length(numbers); i++) {
		var current = numbers[i];
		var previous = numbers[i - 1];
		if (current - previous == 1) {
			ones++;
			show_debug_message("Total ones: " + string(ones));
		}
		else if (current - previous == 3) {
			threes++;
			show_debug_message("Total threes: " + string(threes));
		}
	}
	show_debug_message(ones * (threes + 1));
}

function day_10_part_2(){
	var numbers = string_split_reals("0\n" + read("input.txt"), "\n");
	array_sort(numbers, true);
	var combinations = 0;
	
	var nums = array_create(array_length(numbers));
	nums[0] = 1;
	for (var i = 0; i < array_length(numbers); i++) {
		for (var j = 1; j <= 3; j++) {
			var pos = array_get_index(numbers, numbers[i] + j);
			if (pos != -1) {
				nums[pos] += nums[i];
				combinations = nums[pos];
			}
		}
	}
	show_debug_message(combinations);
}