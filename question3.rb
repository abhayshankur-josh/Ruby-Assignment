letters = ("a" .. "z").to_a

puts "Printing A-Z in reverse order"
for index in (0 .. letters.length-1) do
  puts letters[-(index+1)]
end

