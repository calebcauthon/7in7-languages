Builder := Object clone
Builder number_of_spaces_to_indent := 0

Builder forward := method(
  call target number_of_spaces_to_indent = call target number_of_spaces_to_indent + 3
  indentation := ""
  for(i, 1, number_of_spaces_to_indent, indentation = "#{indentation} " interpolate)

  writeln("#{indentation}<" interpolate, call message name, ">")
  call message arguments foreach(
	arg, 
	content := self doMessage(arg); 
	if(content type == "Sequence", writeln("#{indentation}#{content}" interpolate)))

  writeln("#{indentation}</" interpolate, call message name, ">")
  call target number_of_spaces_to_indent = call target number_of_spaces_to_indent - 3
  )
  
Builder  ul(
	li("Io"), 
	li("Lua"), 
	li("JavaScript"))