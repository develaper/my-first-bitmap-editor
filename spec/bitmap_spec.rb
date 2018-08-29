require 'bitmap'

describe Bitmap do
	context 'acces to pixel' do
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
end