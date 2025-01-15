=begin
  WAP for students to print their school level according to grade
  e.g -
    if grade is between 1-5 return elementary
    if grade is between 6-8 return middle school
    if grade is between 9-12 return high school
    if grade is between otherwise return college
=end

def get_grade(grade)
  case grade.to_i
  when (1 .. 5)
    "Elementary"
  when (6 .. 8)
    "Middle School"
  when (9 .. 12)
    "High School"
  else
    "College"
  end
end

#Get User Input
puts "Enter your Grade"
grade = gets()
puts "Your School level according to grade is #{get_grade(grade)}"
