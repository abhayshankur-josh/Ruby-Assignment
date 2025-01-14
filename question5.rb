
def get_ip_address_class(ip_add)
  if ip_add.count === 4
    
    # To check each block is in range of 0-255.
    ip_add.each do |i|
      if !(0..225).to_a.include?(i.to_i)
        puts "IP Invalid!"
        return nil
      end
    end

    # Using Case - Statement to identify class based on choice.
    case ip_add.first.to_i
    when (0 .. 127)
      puts "#{ip_add} belongs to class A."
    when (128 .. 191)
      puts "#{ip_add} belongs to class B."
    when (192 .. 223)
      puts "#{ip_add} belongs to class C."
    when (224 .. 239)
      puts "#{ip_add} belongs to class D."
    when (240 .. 255)
      puts "#{ip_add} belongs to class E."
    else
      puts "Invalid IP Address #{ip_add}"
    end

  else
    puts "Cannot identify class for given IP Address"
  end
end

# Getting User Input for Program.
puts "Enter IP Address : "
ip_address = gets
ip_address = ip_address.split('.')

get_ip_address_class(ip_address)
