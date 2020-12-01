function day_1_part_1() {
	var input = read_reals("input.txt");
	var nums = get_2_addends(input, 2020);
	show_debug_message(nums[0] * nums[1]);
}

function day_1_part_2() {
	var input = read_reals("input.txt");
	var nums = get_3_addends(input, 2020);
	show_debug_message(nums[0] * nums[1] * nums[2]);
}

function get_2_addends(arr, sum) {
	for (var i = 0; i < array_length(arr); i++) {
		for (var j = i + 1; j < array_length(arr); j++) {
			if (arr[i] + arr[j] == sum) {
				return [arr[i], arr[j]];
			}
		}
	}
}

function get_3_addends(arr, sum) {
	for (var i = 0; i < array_length(arr); i++) {
		for (var j = i + 1; j < array_length(arr); j++) {
			for (var k = j + 1; k < array_length(arr); k++) {
				if (arr[i] + arr[j] + arr[k] == sum) {
					return [arr[i], arr[j], arr[k]];
				}
			}
		}
	}
}