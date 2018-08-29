require_relative 'bitmap'
class BitmapEditor

  def run(file)
    return puts "please provide correct file" if file.nil? || !File.exists?(file)

    File.open(file).each do |line|
      begin
        command, args = set_command_and_args(line)
        exec_command(command, args)
      rescue RuntimeError => error
        puts "Error:", error.message
      end
    end
  end

  def exec_command(command, args = [])
    case command
    when 'I'
      fail "There's already an image!" if @bitmap
      check_number_of_args(args, 2)
      args.each do |arg|
        check_arg_is_numeric(arg)
        check_arg_is_in_range(arg)
      end 
      @bitmap = Bitmap.new(*args)
    when 'C'
      bitmap_exists?
      check_number_of_args(args, 0)
      @bitmap.clear!
    when 'L'
      bitmap_exists?
      check_number_of_args(args, 3)
      coordinates = [args[0],args[1]]
      color = args[2]
      coordinates.each {|arg| check_arg_is_numeric(arg)}
      check_arg_is_color(color)
      @bitmap.set_color(*args)
    when 'V'
      before_draw_segment(args)
      @bitmap.draw_vertical_segment!(*args)
    when 'H'
      before_draw_segment(args)
      @bitmap.draw_horizontal_segment!(*args)
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

  def check_number_of_args(args, number_of_args)
    fail "Invalid number of args: expected #{number_of_args}, got #{args.length}" unless valid_number_of_args?(args, number_of_args)
  end

  def valid_number_of_args?(args, number_of_args)
    args.length == number_of_args
  end

  def check_arg_is_numeric(arg)
    fail "Invalid arg: expected a numeric value, got #{arg}" unless is_numeric?(arg)
  end

  def is_numeric? (arg)
    arg =~ /[[:digit:]]/
  end

  def check_arg_is_in_range(arg)
    fail "Value out of range: expected a numeric value between 1 and 250, got #{arg}" unless is_in_range?(arg, 250)
  end

  def is_in_range? (arg, range)
    arg.to_i.between?(1, range)
  end

  def check_arg_is_color(arg)
    fail "Invalid arg: expected a letter, got #{arg}" unless is_a_color?(arg)
  end

  def is_a_color?(arg)
    arg =~ /[[:alpha:]]/
  end

  def bitmap_exists?
    fail "There's no image" unless @bitmap
  end

  def before_draw_segment(args)
    bitmap_exists?
    check_number_of_args(args, 4)
    coordinates = [args[0],args[1],args[2]]
    color = args[3]
    coordinates.each { |arg| check_arg_is_numeric(arg) }
    check_arg_is_color(color)
  end
end