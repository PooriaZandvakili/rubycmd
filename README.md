# RubyCmd

rubycmd is a simple ruby gem to create shell apps like cmd library in python

## How to install ?

Use this command to install the gem : 
`gem install rubycmd`

## How to use?

Using rubycmd is too easy. 

Lets have a look to an example code :

```ruby
class Cmd
	private
	def do_whoami (args_hash)
		# it will be 'whoami' command
		# anything you want to the program do
		puts "root"
	end
	def help_whoami
		# help for whoami command
		puts "this command will show you the username"
	end
end

shell = Cmd.new()
shell.loopcmd()
```

This is executed program:

```text
cmd> whoami
root
cmd> help whoami
this command will show you the username
cmd> help

Avalable commands :

help                    this command will show you the username

cmd>
```

To create a shell app with rubycmd just create a 'Cmd' class with private methods.

do_COMMAND will executes when user type 'COMMAND' in the program. These functions can get an arguments. In the example code this argument's name is 'args_hash'. args_hash is a hash variable and it contains arguments of the command. 

help_COMMAND will executes when the user type 'help COMMAND' in the program. These functions can **NOT** get arguments. The use can type 'help' to see list of commands.


## How to change the prompt ?

When you create a new instance from Cmd class you can pass these three arguments:
1. prompt
2. banner
3. msg

By default prompt is 'cmd> ' . banner and msg are not set.
To set these arguments do like this:

```ruby
class Cmd
# methods
end

shell = Cmd.new(prompt: "root@localhost:~# " , banner: Tools.figlet("banner" , "slant") , msg: "test message")

shell.cmdloop
```

```text
    __
   / /_   ____ _   ____    ____   ___    _____
  / __ \ / __ `/  / __ \  / __ \ / _ \  / ___/
 / /_/ // /_/ /  / / / / / / / //  __/ / /
/_.___/ \__,_/  /_/ /_/ /_/ /_/ \___/ /_/


[~] test message
root@localhost:~#
```

## My other ruby gems

I'm a beginner in ruby programming and this is my first gem 

HOPE YOU LIKE IT!	