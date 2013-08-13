File.open("E:/lib/UUID.txt",'r') do |file|
  while line = file.gets
    puts line
    puts line.class
  end
end
