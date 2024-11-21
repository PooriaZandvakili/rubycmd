class Cmd
  CLASS = self
  def initialize (prompt: "cmd> ", banner: "" , msg: "")
    @prompt = prompt
    @banner = banner
    @msg = msg
  end
  def loopcmd
    Tools.print_filget @banner if @banner
    Tools.print_msg @msg unless @msg.empty?
    while true
      begin
        Tools.print @prompt
        command = gets.chomp
        if ["exit" , "quit"].include?(command)
          break
        elsif command.empty?
          nil
        elsif command.start_with?("help")
          handle_help(command)
        else
          handle_command(command)
        end
      rescue Interrupt
        break
      end
    end
  end

  private

  def handle_command (cmd)
    begin
      command , args = Tools.parse_args(cmd)
      if (args.empty? == false)
        eval("do_#{command} (#{args})")
      else
        eval("do_#{command}")
      end
    rescue NameError
      Tools.CommandNotFourd (cmd)
    end
  end

  def handle_help (cmd)
    # Detecting help command without any argument
    if cmd.split(" ").size != 1
      if ["exit" , "quit"].include?(cmd.sub("help " , ""))
        Tools.print "\nExit the program\n\n"
      else
        begin
          eval("#{cmd.sub(" " , "_")}")
        rescue NameError
          Tools.CommandNotFourd(cmd.sub("help " , ""))
        end
      end
    else
      commands = []
      (Cmd.private_instance_methods - Cmd.private_methods).each do |cmd|
        cmd = cmd.to_s
        if cmd.start_with?("do_")
          commands.push(cmd)
        end
      end
      Tools.print_help "Avalable commands :\n"
      commands.each do |cmd|
        cmd.sub!("do_" , "")
        Tools.print_help "#{cmd}\t\t\t\t"
        eval("help_#{cmd}")
      end
      Tools.print "\n"
	  end
  end
end
