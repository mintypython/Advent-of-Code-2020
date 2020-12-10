function in(val, array) {
	for (var i = 0; i < array_length(array); i++) {
		if (val == array[i]) return true;
	}
	return false;
}

function array_slice(array, start, finish) {
	if (start < 0)
		start = array_length(array) + start;
	if (finish < 0)
		finish = array_length(array) + finish;
	
	var arr = [];
	array_copy(arr, 0, array, start, finish - start + 1);
	return arr;
}

function array_get_index(array, value) {
	for (var i = 0; i < array_length(array); i++) {
		if (array[i] == value) return i;
	}
	return -1;
}

function factorial(num) {
	if (num == 1) return 1;
	return num * factorial(num - 1);
}