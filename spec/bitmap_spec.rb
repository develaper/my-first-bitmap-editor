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

	context 'set color' do
		it 'for a specific pixel' do
			bitmap = Bitmap.new(2, 2)
			bitmap.set_color(1, 1, 'V')
			expect(bitmap[1,1]).to eq('V')
		end
	end

	context 'clear' do
			it 'has a method that resets al pixels to O' do
				bitmap = Bitmap.new(2, 2)
				bitmap.set_color(1, 1, 'V')
				bitmap.set_color(1, 2, 'V')
				bitmap.set_color(2, 1, 'V')
				bitmap.set_color(2, 2, 'V')
				bitmap.clear!

				expect(bitmap[1,1]).to eq('O')
				expect(bitmap[1,2]).to eq('O')
				expect(bitmap[2,1]).to eq('O')
				expect(bitmap[2,2]).to eq('O')
			end
	end

	context 'draw horizontal segment' do
			it 'sets color in args' do
				bitmap = Bitmap.new(5, 5)
				bitmap.draw_horizontal_segment!(1, 1, 5, 'R')
				bitmap.draw_horizontal_segment!(3, 1, 4, 'V')

				expect(bitmap[1,2]).to eq('R')
				expect(bitmap[1,3]).to eq('R')
				expect(bitmap[1,4]).to eq('R')
				expect(bitmap[1,5]).to eq('R')
				expect(bitmap[2,1]).to eq('O')
				expect(bitmap[2,2]).to eq('O')
				expect(bitmap[2,3]).to eq('O')
				expect(bitmap[2,4]).to eq('O')
				expect(bitmap[2,5]).to eq('O')
				expect(bitmap[3,1]).to eq('V')
				expect(bitmap[3,2]).to eq('V')
				expect(bitmap[3,3]).to eq('V')
				expect(bitmap[3,4]).to eq('V')
				expect(bitmap[3,5]).to eq('O')
			end
	end


end