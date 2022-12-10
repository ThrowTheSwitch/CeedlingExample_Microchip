require 'open3'

MDB = "mdb.sh"  # or "mdb"

CONFIG_FILE = "./test/simulation/sim_configuration.txt"

test_file = ARGV[0]

stdin, stdout, stderr, wait_thr = Open3.popen3(MDB, CONFIG_FILE)

stdin.puts("Program " + test_file)
stdin.puts("Break UnityHelperDeadLoop")
stdin.puts("Run")

# Failsafe: exit after 30 seconds if SIM does not halt
stdin.puts("Wait 30000")
stdin.puts("Quit")

# Filter out MDB Java logr and NetBeans errors
errors = stderr.readlines.reject { | line | line.match(/(logr|dumb|Preferences)/)}
result = stdout.readlines

Process.waitall

# Remove stray command prompts
result = result.map {|s| s.gsub(/^>/, "")}

# First line of results
test_start = result.find_index { |line| line.match(/^.*\:(?:FAIL|PASS|IGNORE)/) }
# Last line of results
test_status = result.find_index { |line| line.match(/^(?:OK|FAIL)\n/) }

# start and last will be missing if code causes an Exception
if (test_start != nil) & (test_status != nil)
	result = result[test_start , (test_status - test_start) + 1]
end

# Play back cleaned results and errors
result.each do | line |
	STDOUT.print line
end

errors.each do | line |
	STDOUT.print line
end
