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

	def blur_image
		#Make a deep copy of data array
		@blurry = Marshal.load(Marshal.dump(@data))
		
		@data.each_with_index do |row, row_index|
			row.each_with_index do |pixel, column_index|
				if pixel == 1	#Skip this whole block if pixel is not on
					#Top pixel
					if row_index > 0 							#Skip if top row
						@blurry[row_index-1][column_index] = 1
					end

					#Bottom pixel
					if row_index < (@data.count - 1)			#Skip if bottom row
						@blurry[row_index + 1][column_index] = 1
					end

					#Left pixel
					if column_index > 0							#Skip if leftmost column
						@blurry[row_index][column_index - 1] = 1
					end

					#Right pixel
					if column_index < (@data[row_index].count - 1)	#Skip if rightmost column
						@blurry[row_index][column_index + 1] = 1
					end
				end
			end
		end

		#Output the blurred image
		@blurry.each_with_index do |row, row_index|
			row.each_with_index do |pixel, column_index|
				print "#{pixel}"
			end
			print "\n"
		end
	end
end

image = Image.new([
	[0, 0, 0, 0, 0],
	[0, 0, 1, 0, 0],
	[0, 0, 0, 0, 0],
	[0, 0, 0, 0, 0],
	[1, 0, 0, 1, 0],
	[0, 0, 0, 0, 1],

])
puts "Original image:\n"
image.output_image

puts "\nBlurred image:\n"
image.blur_image

