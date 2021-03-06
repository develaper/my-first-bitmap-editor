class Bitmap
	def initialize(m, n)
		@rows_number = n.to_i
		@columns_number = m.to_i
		@bitmap = Array.new(@rows_number){ Array.new(@columns_number, 'O') }
	end

	def [](i, j)
		@bitmap[i-1][j-1]
		if row_in_range?(i) and column_in_range?(j)
			@bitmap[i-1][j-1]
		else
			fail "Values out of range"
		end
	end

	def display
		str = ""
		@bitmap.each{ |row| str += row.join("") + "\n" }
		str
	end

	def set_color(i, j, c)
		if row_in_range?(i) and column_in_range?(j)
			@bitmap[i.to_i-1][j.to_i-1] = c
		else
			fail "Values out of range"
		end
	end

	def clear!
		@bitmap.each { |row| row.map! { |value| 'O' }}
	end

	def draw_horizontal_segment!(i, j, k, v)
		(j.to_i..k.to_i).each { |n| set_color(i.to_i, n, v) }
	end

	def draw_vertical_segment!(i, j, k, v)
		(j.to_i..k.to_i).each { |n| set_color(n, i.to_i, v) }
	end

	def row_in_range?(n)
		n.to_i.between?(1, @rows_number)
	end

	def column_in_range?(m)
		m.to_i.between?(1, @columns_number)
	end
end