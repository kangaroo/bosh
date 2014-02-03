module Bosh::Core
  class Shell
    def initialize(stdout = $stdout)
      @stdout = stdout
    end

    def run(command, options = {})
      output_lines = run_command(command, options)
      output_lines = tail(output_lines, options)

      command_output = output_lines.join("\n")
      report(command, command_output, options)
      command_output
    end

    private

    attr_reader :stdout

    def run_command(command, options)
      stdout.puts command if options[:output_command]
      lines = []

# When using debootstrap with 13.10+ this causes the spawned shell process to be zombied
# and a deadlock on the read for the .each block.  Thankfully this stage doesnt need the
# output so we've extended the options to handle this.
# I also tried variants of IO.popen and open3 and pyt.  Looking at strace, the child
# exits successfully, but stays zombied because the parent is still reading its stdin.
# TODO:  Check if this happens when not using vagrant on osx
      if options[:output_nocapture]
        system(command)
      else
        IO.popen(command).each do |line|
          stdout.puts line.chomp
          lines << line.chomp
        end.close
      end

      lines
    end

    def tail(lines, options)
      line_number = options[:last_number]
      line_number ? lines.last(line_number) : lines
    end

    def report(cmd, command_output, options)
      return if command_exited_successfully?

      err_msg = "Failed: '#{cmd}' from #{pwd}, with exit status #{$?.to_i}\n\n #{command_output}"
      options[:ignore_failures] ? stdout.puts("#{err_msg}, continuing anyway") : raise(err_msg)
    end

    def command_exited_successfully?
      $?.success?
    end

    def pwd
      Dir.pwd
    rescue Errno::ENOENT
      'a deleted directory'
    end
  end
end
