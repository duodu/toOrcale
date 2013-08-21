File.open("E:/lib/UUID.txt",'r') do |file|
  while line = file.gets.strip
    puts line
    puts line.class
    puts line.length
  end
end
