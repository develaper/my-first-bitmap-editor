class Bitmap
	def initialize(m, n)
		@rows_number = n.to_i
		@columns_number = m.to_i
		@bitmap = Array.new(@rows_number){ Array.new(@columns_number, 'O') }
	end

	def [](i, j)
		@bitmap[i-1][j-1]
	end
end