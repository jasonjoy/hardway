# Ask the user for number_of_elements. 
def get_number
	print "How many numbers? "
	@number_of_elements = gets.chomp.to_i
	# Validate input
	if @number_of_elements <= 0
		puts "Invalid input. Please enter an integer greater than 0.\n"
		get_number		
	end
	return @number_of_elements
end

number_of_elements = get_number

# Incrementing from 1, Print Fizz for numbers divible by 3,
# Buzz for numbers divisible by 5, the number for all others.
(1..number_of_elements).each do |i|
	if (i % 3 == 0) && (i % 5 == 0)
		fizzbuzz = "Fizz Buzz"
	elsif (i % 3 == 0)
		fizzbuzz = "Fizz"
	elsif (i % 5 == 0)
		fizzbuzz = "Buzz"
	else 
		fizzbuzz = i		
	end
	puts "#{fizzbuzz}"
end

