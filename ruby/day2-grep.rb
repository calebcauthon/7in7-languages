def print_lines_that_includes this_phrase
	file_input = get_contents_of_this_file 'lorem.txt'
	lines = file_input.split("\n")

	lines.each do |line|
		puts line unless /^.+#{this_phrase}.+$/.match(line).nil?
	end
	nil
end

def get_contents_of_this_file filename
	file = File.open(filename, 'r')
	contents = file.read
	file.close

	contents
end