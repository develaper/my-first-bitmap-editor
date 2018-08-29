require 'bitmap'

describe Bitmap do
	context 'access to a specific pixel' do
		it 'returns the value for an specific pixel' do
			bitmap = Bitmap.new(2, 2)
			expect(bitmap[1,1]).to eq('O')
		end
	end

	context 'new' do
		it 'has all values set to O after creation' do
			bitmap = Bitmap.new(2, 2)
			expect(bitmap[1,1]).to eq('O')
			expect(bitmap[1,2]).to eq('O')
			expect(bitmap[2,1]).to eq('O')
			expect(bitmap[2,2]).to eq('O')
		end
	end

	context 'row in range' do
		it 'returns false if the coordinate is not in range' do
			bitmap = Bitmap.new(5, 5)
			expect(bitmap.row_in_range?(6)).to be_falsey
		end

		it 'returns true if the coordinate is in range' do
			bitmap = Bitmap.new(5, 5)
			expect(bitmap.row_in_range?(4)).to be_truthy
		end
	end

	context 'column in range' do
		it 'returns false if the coordinate is not in range' do
			bitmap = Bitmap.new(5, 5)
			expect(bitmap.column_in_range?(6)).to be_falsey
		end

		it 'returns true if the coordinate is in range' do
			bitmap = Bitmap.new(5, 5)
			expect(bitmap.column_in_range?(5)).to be_truthy
		end
	end

	context 'display' do
		it 'returns a visual representation' do
			bitmap = Bitmap.new(2, 2)
			expect(bitmap.display).to eq("OO\n"+"OO\n")
		end
	end
end