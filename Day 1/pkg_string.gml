function string_split_op(str, delimiter, op) {
	var arr = [];
	while (str != "") {
		var pos = string_pos(delimiter, str);
		if (pos == 0) pos = string_length(str) + 1;
		
		arr[array_length(arr)] = op(string_copy(str, 1, pos - 1));
		str = string_delete(str, 1, pos);
	}
	return arr;
}