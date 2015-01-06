# This problem builds off the Image Blur #2 assignment and is designed to bring your coding
# abilities to their furthest levels. This will be the last assignment that will involve
# manipulating the image data structure we built earlier.
# Given an image, we want to build a method to blur the image, however instead of only
# blurring images that are within 1 pixel, we want to specify how far to blur pixels that
# are within a Manhattan Distance of what is specified. In the previous assignment we built
# a method that will produce the blurring with a Manhattan Distance of 1. Build the method
# def blur(distance) that will implement a blurring of the Manhattan distance specified.
# In short: you want to find all 1's and turn any pixels that can be reached by making n
# moves or less using only left, right, up or down from the starting point.

class Image
	attr_accessor :data, :blurry
	def initialize(data)
		@data = data
	end

	def output_image
		@data.each_with_index do |row, row_index|
			row.each_with_index do |pixel, column_index|
				print "#{pixel}"
			end
			print "\n"
		end
	end

	def blur(distance)

		# Initialize blurry as a 3 dimensional array
		@blurry = [[[]]]
		# Make a deep copy of image data array into the starting array for @blurry
		@blurry[0] = Marshal.load(Marshal.dump(@data))
		
		# Cycle thru the same number of times as distance
		distance.times do |i|

			# Copy previous iteration of image data into the next position of @blurry
			@blurry[i+1] = Marshal.load(Marshal.dump(@blurry[i]))	

			# Using @blurry[i] as a starting point, turn on blur pixels in @blurry[i+1] 
			@blurry[i].each_with_index do |row, row_index|
				row.each_with_index do |pixel, column_index|
					if pixel == 1	#Skip this whole block if pixel is not on
						#Top pixel
						if row_index > 0 							#Skip if top row
							@blurry[i+1][row_index-1][column_index] = 1
						end

						#Bottom pixel
						if row_index < (@data.count - 1)			#Skip if bottom row
							@blurry[i+1][row_index + 1][column_index] = 1
						end

						#Left pixel
						if column_index > 0							#Skip if leftmost column
							@blurry[i+1][row_index][column_index - 1] = 1
						end

						#Right pixel
						if column_index < (@data[row_index].count - 1)	#Skip if rightmost column
							@blurry[i+1][row_index][column_index + 1] = 1
						end
					end
				end
			end
		end

		#Display the blurred image
		puts "\nBlurred image (distance:#{distance})\n"
		@blurry[distance].each_with_index do |row, row_index|
			row.each_with_index do |pixel, column_index|
				print "#{pixel}"
			end
			print "\n"
		end
	end
end

image = Image.new([
	[0, 0, 0, 0, 0, 0],
	[0, 0, 1, 0, 0, 0],
	[0, 0, 0, 0, 0, 0],
	[0, 0, 0, 0, 0, 0],
	[0, 0, 0, 1, 0, 0],
	[0, 0, 0, 0, 0, 0],
	[1, 0, 0, 0, 0, 0]
])

puts "Original image:\n"
image.output_image

image.blur(ARGV[0].to_i)

