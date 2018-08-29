class BitmapEditor

  def run(file)
    return puts "please provide correct file" if file.nil? || !File.exists?(file)

    File.open(file).each do |line|
      command, args = set_command_and_args(line)
      exec_command(command, args)
    end
  end

  def exec_command(command, args = [])
    case command
    when 'S'
        puts "There is no image"
    else
        puts 'unrecognised command :('
    end
  end

  def set_command_and_args(line)
    if line.length == 1
      command, args = line[0], []
    else
      command, *args = line.split(' ')   
    end
    if is_a_valid_command? command
      [command, args]
    else
      fail "Command unknown: '#{command}'" 
    end
  end

  def is_a_valid_command? (command)
    ['I','C','L','F','V','H','S'].include? command
  end
end