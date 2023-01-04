require 'open3'

test_file = ARGV.shift
mdb_command = ARGV.shift
timeout = ARGV.shift

stdin, stdout, stderr, wait_thr = Open3.popen3(mdb_command)

stdin.puts "Device #{ARGV.shift}"
stdin.puts "Hwtool #{ARGV.shift}"

ARGV.each_slice(2) do | opt, val |
	stdin.puts "set #{opt} #{val}"
end

stdin.puts "Program #{test_file}"

stdin.puts "Break UnityHelperDeadLoop"
stdin.puts "Run"
stdin.puts "Wait #{timeout}"
stdin.puts "Quit"


# Filter out MDB Java logr and NetBeans errors
errors = stderr.readlines.reject { | line | line.match(/(logr|dumb|Preferences)/)}
result = stdout.readlines

Process.waitall

# Remove command prompts
result = result.map {|s| s.gsub(/^>/, "")}

# Results start 2 lines after Running, and end with OK or FAIL
test_start = result.find_index { |line| line.match(/^Running/) }
test_status = result.find_index { |line| line.match(/^(?:OK|FAIL)\n/) }

if (test_start != nil) & (test_status != nil)
	result = result[test_start + 2 , (test_status - test_start - 1)]
end

STDOUT.print result.join()
STDERR.print errors.join()

