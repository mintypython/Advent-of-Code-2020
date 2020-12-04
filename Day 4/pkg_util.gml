function in(val, array) {
	for (var i = 0; i < array_length(array); i++) {
		if (val == array[i]) return true;
	}
	return false;
}