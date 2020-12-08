function Computer(str) constructor {

	// Parse instruction string into array
	instructions = string_split(str,"\n");
	for (var i = 0; i < array_length(instructions); i++) {
		var instruction = string_split(instructions[i], " ");
		instructions[i] = { command: instruction[0], value: real(instruction[1]) };
	}
	
	// Holds a value
	accumulator = 0;
	
	// Current position in instruction array
	pos = 0;
	
	run = function() {
		accumulator = 0;
		pos = 0;
		var positions = ds_list_create();		
		while (pos < array_length(instructions) && ds_list_find_index(positions, pos) == -1) {
			ds_list_add(positions, pos);
			eval();
		}
		return ds_list_find_index(positions, pos) == -1;
	}
	
	eval = function() {
		var instruction = instructions[pos];
		if (variable_struct_exists(commands, instruction.command)) {
			variable_struct_get(commands, instruction.command)(instruction.value);
		}
	}
	
	commands = {
		acc: function(num) {
			accumulator += num;
			pos++;
		},
		
		jmp: function(num) {
			pos += num;
		},
		
		nop: function(num) {
			pos++;
		}
	}
	
	var command_names = variable_struct_get_names(commands);
	for (var i = 0; i < array_length(command_names); i++) {
		commands[$ command_names[i]] = method(self, commands[$ command_names[i]]);
	}
}