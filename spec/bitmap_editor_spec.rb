require 'bitmap_editor'

describe BitmapEditor do
	context 'set command and args' do
		it 'sets empty args when a single command' do
			bitmap_editor = BitmapEditor.new()
			expect(bitmap_editor.set_command_and_args('I')).to eq(['I',[]])
		end
		it 'sets rest of the line as args when a command has args' do
			bitmap_editor = BitmapEditor.new()
			expect(bitmap_editor.set_command_and_args('I D D S')).to eq(['I',["D","D","S"]])
		end
	end

	context 'is a valid command' do
		it 'returns false if the command is not valid' do
			bitmap_editor = BitmapEditor.new()
			expect(bitmap_editor.is_a_valid_command?('X')).to be_falsey
		end
		it 'returns true if the command is valid' do
			bitmap_editor = BitmapEditor.new()
			expect(bitmap_editor.is_a_valid_command?('S')).to be_truthy
		end
	end

	context 'valid number of argumentes' do
		it 'returns false if the number of args is not valid' do
			bitmap_editor = BitmapEditor.new()
			expect(bitmap_editor.valid_number_of_args?(["D","D","S"], 2)).to be_falsey
		end

		it 'returns true if the number of args is valid' do
			bitmap_editor = BitmapEditor.new()
			expect(bitmap_editor.valid_number_of_args?(["D","D"], 2)).to be_truthy
		end
	end

	context 'is numeric' do
		it 'returns false if the arg is not numeric' do
			bitmap_editor = BitmapEditor.new()
			expect(bitmap_editor.is_numeric?('D')).to be_falsey
		end

		it 'returns true if the arg is numeric' do
			bitmap_editor = BitmapEditor.new()
			expect(bitmap_editor.is_numeric?('78')).to be_truthy
		end
	end
	
	context 'is in range' do
		it 'returns false if the arg is not in range' do
			bitmap_editor = BitmapEditor.new()
			expect(bitmap_editor.is_in_range?('258', 250)).to be_falsey
		end

		it 'returns true if the arg is in range' do
			bitmap_editor = BitmapEditor.new()
			expect(bitmap_editor.is_in_range?('78', 250)).to be_truthy
		end
	end

	context 'is a color' do
		it 'returns false if the arg is not a letter' do
			bitmap_editor = BitmapEditor.new()
			expect(bitmap_editor.is_a_color?('3')).to be_falsey
		end

		it 'returns true if the arg is a letter' do
			bitmap_editor = BitmapEditor.new()
			expect(bitmap_editor.is_a_color?('B')).to be_truthy
		end
	end
end	
