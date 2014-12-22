class Image
	attr_accessor :data
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
end

image = Image.new([
	[0, 0, 0, 0],
	[0, 1, 0, 0],
	[0, 0, 0, 1],
	[0, 0, 0, 0]
])
image.data[1][1] = 0
image.output_image