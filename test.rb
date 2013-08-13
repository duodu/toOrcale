my_array = Array.new
my_array = [1,2,3]
for i in 0 .. 100
  puts my_array[(i+1)%3-1]
end
