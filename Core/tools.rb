require 'colorize'
require 'ruby_figlet'

class Tools
  def self.parse_args (str)
    command_pattern = /^[a-zA-Z]+/
    command = str.scan(command_pattern)[0]
    args_pattern = /-{1,2}([a-z-]+)[=|\s](\S+)/
    parsed = str.scan(args_pattern)
    args = Hash.new
    parsed.each do |arg|
      args[arg[0].to_sym] = arg[1]
    end
    return command , args
  end

  def self.figlet (text , font)
    RubyFiglet::Figlet.new(text , font)
  end

  def self.print_filget (figlet)
    puts figlet.to_s.red
  end

  def self.print_help (text)
    $stdout.write "\n[@] ".blue+text.white
    $stdout.flush()
  end

  def self.print_success (text)
    $stdout.write "[+] ".green+text+"\n".white
    $stdout.flush()
  end

  def self.print_warning (text)
    $stdout.write "[!] ".yellow+text+"\n".white
    $stdout.flush()
  end

  def self.print_error (text)
    $stdout.write "[!!!] ".red+text+"\n".white
    $stdout.flush()
  end

  def self.print_msg (text)
    $stdout.write "\n\n[~] ".green+text+"\n".white
    $stdout.flush()
  end

  def self.print (text)
    $stdout.write text.white
    $stdout.flush()
  end

  def self.CommandNotFourd (cmd)
    Tools.print_error("'#{cmd}' command not found.\n")
  end
end
