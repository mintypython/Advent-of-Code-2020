function read(filename) {
	var buff = buffer_load(filename);
	var str = buffer_read(buff, buffer_text);
	buffer_delete(buff);
	return string_replace_all(str, "\r", "");
}