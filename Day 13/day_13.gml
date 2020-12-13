function day_13_part_1(){
	var info = string_split(read("input.txt"), "\n");
	
	// Get starting time
	var time = real(info[0]);
	
	// Gather individual buses (trim out x's)
	var buses = string_split(info[1], ",");
	
	// Find earliest bus and arrival time
	var earliest_bus = 0;
	var earliest_arrival = infinity;
	for (var i = 0; i < array_length(buses); i++) {
		if (buses[i] == "x") continue;
		var bus = real(buses[i]);
		
		// Calculate arrival time
		var arrival = ceil(time/bus) * bus - time;
		
		if (arrival < earliest_arrival) {
			earliest_bus = bus;
			earliest_arrival = arrival;
		}
	}
	
	show_debug_message("Earliest bus: " + string(earliest_bus) + "\n" + 
					   "Earliest arrival: " + string(earliest_arrival) + "\n" +
					   "Answer: " + string((earliest_arrival)* earliest_bus));
}

function day_13_part_2(){
	var info = string_split(read("input.txt"), "\n");
	
	// Gather individual buses (trim out x's)
	info[1] = string_split(info[1], ",");
	var buses = [];
	for (var i = 0; i < array_length(info[1]); i++){
		if (info[1][i] == "x") continue;
		buses[array_length(buses)] = { time: real(info[1][i]), pos: i };
	}
	
	// Loop, find common intervals
	var time = 0, start = time;
	var interval = buses[0].time;
	for (var i = 1; i < array_length(buses); i++) {
		var found = 0;
		while(true) {
			if ((time + buses[i].pos) % buses[i].time == 0) {
				found++;
				if (found == 1) {
					start = time;
				}
				else {
					interval = time - start;
					time = start;
					break;
				}
			}
			time += interval;
		}
	}
	
	show_debug_message(time);
}