# Write a program to display number is prime or not

def is_prime_num?(num)
  if num == 1 
    return "#{num} is not a Prime nor Composite."
  elsif num <1 
    return  "Number is less than 1."
  else
    for i in (2 .. num/2) do
      if (num%i)==0 
        return "#{num} is not a Prime Number."
      end
    end
  end
  "#{num} is a Prime Number." 
end

puts "Enter the Number : "
num = gets.to_i
puts is_prime_num?(num)
