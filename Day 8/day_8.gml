function day_8_part_1(){
	var computer = new Computer(read("input.txt"));
	computer.run();
	show_debug_message(computer.accumulator);
}

function day_8_part_2(){
	var computer = new Computer(read("input.txt"));
	var i = 0;
	while (true) {		
		var ins = computer.instructions[i++];
		
		if (ins.command == "jmp")
			ins.command = "nop";
		else if (ins.command == "nop")
			ins.command = "jmp";
		
		// Test if game loops infinitely
		if (computer.run()) break;
		
		if (ins.command == "jmp")
			ins.command = "nop";
		else if (ins.command == "nop")
			ins.command = "jmp";
	}
	
	// The answer!
	show_debug_message(computer.accumulator);
}