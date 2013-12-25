random_number = rand(10)
user_picked = nil

begin 
  unless user_picked.nil?
    if user_picked > random_number
      puts "too high!"
    else
      puts "too low!"
    end
  end  

  puts "choose a number: "
  user_picked  = gets.to_i
end until user_picked == random_number 

puts "you picked #{user_picked}"
puts "the random number is #{random_number}"
