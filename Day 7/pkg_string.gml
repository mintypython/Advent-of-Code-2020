function string_split_op(str, delimiter, op) {
	var arr = [];
	while (str != "") {
		var pos = string_pos(delimiter, str);
		if (pos == 0) pos = string_length(str) + 1;
		arr[array_length(arr)] = op(string_copy(str, 1, pos - 1));
		str = string_delete(str, 1, pos + string_length(delimiter) - 1);
	}
	return arr;
}

function string_split(str, delimiter) {
	return string_split_op(str, delimiter, function(element) { return element; });
}

function string_split_reals(str, delimiter) {
	return string_split_op(str, delimiter, function(element) { return real(element); });
}

function string_split_trim(str, delimiter) {
	return string_split_op(str, delimiter, function(element) { return trim(element); });
}

function trim(str) {
	while(string_length(str) > 0 && whitespace(string_char_at(str, 1))) {
		str = string_delete(str, 1, 1);
	}
	while(string_length(str) > 0 && whitespace(string_char_at(str, string_length(str)))) {
		str = string_delete(str, string_length(str), 1);
	}
	return str;
}

function whitespace(char) {
	return in(char, [" ","\n","\r"]);
}

function join(array, delimiter) {
	var str = "";
	for (var i = 0; i < array_length(array); i++) {
		str += string(array[i]);
		if (i < array_length(array) - 1) {
			str += delimiter;
		}
	}
	return str;
}