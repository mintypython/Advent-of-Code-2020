function day_9_part_1() {
	var numbers = string_split_reals(read("input.txt"), "\n");
	
	var range = 25;
	for (var i = range; i < array_length(numbers); i++) {
		if (!d9p1_validate(numbers, i, range)) {
			show_debug_message(numbers[i]);
			return;
		}
	}
}

function day_9_part_2() {
	var numbers = string_split_reals(read("input.txt"), "\n");
	
	for (var i = 0; i < array_length(numbers); i++) {
		var res = d9p2_find_contiguous_set(numbers, i, 393911906);
		if (res != -1) {
			show_debug_message(res);
		}
	}
}

function d9p1_validate(array, position, range) {
	var num = array[position];
	for (var i = position - range; i < position; i++) {
		for (var j = i + 1; j < position; j++) {
			if (array[i] + array[j] == num)
				return true;
		}
	}
	return false;
}

function d9p2_find_contiguous_set(array, position, target) {
	var tot = 0;
	
	var smallest = infinity;
	var largest = 0;
	
	for (var i = position; i < array_length(array); i++){
		var val = array[i];
		smallest = min(smallest, val);
		largest  = max(largest, val);
		
		tot += val;
		if (tot == target)
			return smallest + largest;
		if (tot > target)
			return -1;
	}
	return -1;
}