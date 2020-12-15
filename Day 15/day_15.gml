function day_15_part_1(){
	var input = string_split_reals(read("input.txt"),",");
	var nums = [];
	var num = 0;
	var i;
	for (i = 1; i <= array_length(input); i++) {
		num = d15_get(nums, input[i - 1], i);
	}
	
	var target = 2020;
	while (i <= target) {
		if (i == target) show_debug_message("NUM: " + string(num));
		num = d15_get(nums, num, i);
		i++;
	}
}

function day_15_part_2(){
	var input = string_split_reals(read("input.txt"),",");
	var nums = [];
	var num = 0;
	var i;
	for (i = 1; i <= array_length(input); i++) {
		num = d15_get(nums, input[i - 1], i);
	}
	
	var target = 30000000;
	while(i <= target) {
		if (i == target) show_debug_message("NUM: " + string(num));
		num = d15_get(nums, num, i);
		i++;
	}
}

function d15_get(map, num, pos) {
	var res;
	if (array_length(map) <= num || map[num] == 0)
		res = 0;
	else
		res = pos - map[@ num];
	
	map[@ num] = pos;
	
	return res;
}