class Voice
  def initialize(options = {})
    run_command parse_options options
  end

  def run_command options
    command = "say #{options} --progress"
    puts command
    system command
  end

  def parse_options options
    options_string = ""
    options.each do |option, value|
      options_string += "#{create_argument(option, value)} "
    end
    return options_string
  end

  def create_argument option, value
    if option == :string
      "'#{value}'"
    else
      "--#{option}=#{value}"
    end
  end
end