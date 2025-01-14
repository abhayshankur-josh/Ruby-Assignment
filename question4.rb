def regex_mobile_number(mobile_number)
  pattern = /^(\+91)?\s?(\d{10})$/
  if pattern.match?(mobile_number)
    return "Phone Number is Valid."
  else 
    return "Phone number is Not Valid."
  end
end


def regex_email(email)
  pattern = /^[A-z\.0-9]+@[a-z]+\.[a-z]{3}$/
  if pattern.match?(email)
    return "Email is Valid."
  else 
    return "Email is Not Valid."
  end
end

def regex_gender(gender)
  pattern = /^(male|female)+$/
  if pattern.match?(gender.down) 
    return "Valid Gender."
  else 
    return "Invalid Gender."
  end
end

def regex_name(name)
  pattern =/^([A-z]+)\s([A-z]\s)?([A-z]+)$/
  if pattern.match?(name)
    return "Name is Valid."
  else
    return "Name is Invalid."
  end
end

def regex_amount(amount)
  pattern = /^\d+$/
  if pattern.match?(amount)
    return "Amount is Valid"
  else 
    return "Amount is Not Valid"
  end
end

print("Enter Your Name:"); name = gets
print("Enter Your Email: "); email = gets
print("Enter Your Gender):"); gender = gets
print("Enter Your Contact Number:"); phone = gets
print("Enter Your Amount:"); amount = gets

puts regex_name(name)
puts regex_email(email)
puts regex_gender(gender)
puts regex_mobile_number(phone)
puts regex_amount(amount)
