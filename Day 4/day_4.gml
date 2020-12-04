function day_4_part_1(){
	var text = read("input.txt");
	text = string_replace_all(text, "\r", "");
	
	var total = 0;
	var lines = string_split(text, "\n\n");
	for (var i = 0; i < array_length(lines); i++) {
		var map = ds_map_create();
		var keys = string_split(string_replace_all(lines[i], "\n", " ")," ");
		for (var j = 0; j < array_length(keys); j++) {
			var pair = string_split(keys[j], ":");
			show_debug_message(array_length(pair));
				ds_map_add(map, pair[0], pair[1]);
		}
		if (ds_map_exists(map, "byr") &&
			ds_map_exists(map, "iyr") &&
			ds_map_exists(map, "eyr") &&
			ds_map_exists(map, "hgt") &&
			ds_map_exists(map, "hcl") &&
			ds_map_exists(map, "ecl") &&
			ds_map_exists(map, "pid"))
			total++;
		ds_map_destroy(map);
	}
	show_debug_message(total);
}

function day_4_part_2(){
	var text = read("input.txt");
	text = string_replace_all(text, "\r", "");
	
	var total = 0;
	var lines = string_split(text, "\n\n");
	for (var i = 0; i < array_length(lines); i++) {
		var map = ds_map_create();
		var keys = string_split(string_replace_all(lines[i], "\n", " "), " ");
		for (var j = 0; j < array_length(keys); j++) {
			var pair = string_split(keys[j], ":");
				ds_map_add(map, pair[0], pair[1]);
		}
		if (ds_map_exists(map, "byr") &&
			ds_map_exists(map, "iyr") &&
			ds_map_exists(map, "eyr") &&
			ds_map_exists(map, "hgt") &&
			ds_map_exists(map, "hcl") &&
			ds_map_exists(map, "ecl") &&
			ds_map_exists(map, "pid")){								
				// Validate years
				var byr = real(map[? "byr"]);
				if !(byr >= 1920 && byr <= 2020) continue;
				var iyr = real(map[? "iyr"]);
				if !(iyr >= 2010 && iyr <= 2020) continue;
				var eyr = real(map[? "eyr"]);
				if !(eyr >= 2020 && eyr <= 2030) continue;
				
				// Validate height
				var hgt = real(string_digits(map[? "hgt"]));
				var hgt_unit = string_letters(map[? "hgt"]);
				if (hgt_unit == "cm") {
					if !(hgt >= 150 && hgt <= 193) continue;
				}
				else if (hgt_unit == "in") {
					if !(hgt >= 59 && hgt <= 76) continue;
				}
				else continue;
				
				// Validate hair color
				var hcl = map[? "hcl"];
				if (string_char_at(hcl, 1) != "#" || string_length(hcl) != 7) continue;
				var test = false;
				for (var j = 2; j <= string_length(hcl); j++){
					if (!in(string_char_at(hcl, j), ["0","1","2","3","4","5","6","7","8","9","a","b","c","d","e","f"])){
						test = true;
						break;
					}
				}
				if (test) continue;
				
				// Validate eye color
				var ecl = map[? "ecl"];
				if !(in(ecl, ["amb", "blu", "brn", "gry", "grn", "hzl", "oth"])) continue;
				
				// Validate passport id
				var pid = map[? "pid"];
				if (string_digits(pid) != pid || string_length(pid) != 9) continue;
				
				// If we haven't continued yet, everything is valid!
				total++;
			}
		ds_map_destroy(map);
	}
	show_debug_message(total);
}