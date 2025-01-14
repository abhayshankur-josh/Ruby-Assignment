 
def get_grade(grade)
  case grade.to_i
  when (1 .. 5)
    return "Elementary"
  when (6 .. 8)
    return "Middle School"
  when (9 .. 12)
    return "High School"
  else
    return "College"
  end
end

#Get User Input
puts "Enter your Grade"
grade = gets()
puts "Your School level according to grade is #{get_grade(grade)}"
