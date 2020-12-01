function read(filename) {
	var buff = buffer_load(filename);
	var str = buffer_read(buff, buffer_text);
	buffer_delete(buff);
	return str;
}

function read_reals(filename) {
	var arr = string_split_op(read(filename), "\n", function(element) { return real(element); });
	return arr;
}