function day_7_part_1(){
	var lines = string_split(read("input.txt"), "\n");
	
	var bags = create_bag_map(lines);
	var total = 0;
	for (var i = ds_map_find_first(bags); i != undefined; i = ds_map_find_next(bags, i)) {
		if (find_target(bags, i, "shiny gold")){
			total++;
		}
	}
	ds_map_destroy(bags);
		
	show_debug_message(total);
}

function day_7_part_2() {
	var lines = string_split(read("input.txt"), "\n");
	
	var bags = create_bag_map(lines);
	var total = bag_total(bags, "shiny gold");
	ds_map_destroy(bags);
	
	show_debug_message(total);
}

function create_bag_map(array) {
	var bags = ds_map_create();
	for (var i = 0; i < array_length(array); i++) {
		var elements = string_split_trim(string_delete(array[i], string_length(array[i]), 1), "contain");
		
		// get key
		var key = join(array_slice(string_split(elements[0], " "), 0, -2), " ");
		
		// get values
		var value = string_split_trim(elements[1], ",");
		
		var map = ds_map_create();
		for (var j = 0; j < array_length(value); j++) {
			var element = value[j];
			var words = string_split(element, " ");
			if (words[0] != "no") {
				map[? join(array_slice(words, 1, -2), " ")] = real(words[0]);
			}
		}
		ds_map_add_map(bags, key, map);
	}
	return bags;
}

function find_target(map, key, target) {
	var nodes = map[? key];
	for (var i = ds_map_find_first(nodes); i != undefined; i = ds_map_find_next(nodes, i)) {
		if (i == target || find_target(map, i, target))
			return true;
	}
	return false;
}

function bag_total(map, key) {
	var nodes = map[? key];
	var total = 0;
	for (var i = ds_map_find_first(nodes); i != undefined; i = ds_map_find_next(nodes, i)) {
		total += nodes[? i] + nodes[? i] * bag_total(map, i);
	}
	return total;
}