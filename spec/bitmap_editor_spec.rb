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
	
end	
