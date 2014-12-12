# List some places, then send you to a random destination

class Place
	attr_accessor :city, :country

	def initialize (city, country)
		#Make variables in this instance accessible outside this method
		@city = city
		@country = country
	end
 
 	# Method to combine variables into one formatted text string
 	def formatted
 		"#{self.city}, #{self.country}"
 	end

end

class Map
	attr_accessor :places
	
	def initialize
		@places = []
		# Add some places
		@places << Place.new(:Paris, :France)
		@places << Place.new(:Berlin, :Germany)
		@places << Place.new(:Tokyo, :Japan)
		@places << Place.new("New York", :USA)
		@places << Place.new(:Dublin, :Ireland)
		@places << Place.new("San Jose", "Costa Rica")
	end

	def throw_the_dart
		wheres_the_dart = @places[rand(places.length)]
		"#{wheres_the_dart.formatted}"
	end

	def list_places
		@places.each do |p|
			puts "\t#{p.formatted}"
		end
	end
end

# Encapsulate a bunch of Places in the Map class
map = Map.new

puts "These are all of the places I know about:\n"
map.list_places

#Pick a random place to send me
puts "\nToday, I\'m going to send you to #{map.throw_the_dart}."
