require 'open3'

MDB = "/Applications/microchip/mplabx/v6.05/mplab_platform/bin/mdb.sh"
SCRIPT_FILE = "./test/simulation/sim_instructions.txt"

test_file = ARGV[0]

stdin, stdout, stderr, wait_thr = Open3.popen3(MDB, SCRIPT_FILE)

stdin.puts("Program " + test_file)
stdin.puts("Run")

result = []

# Send Quit when test completion, unexpected termination
# or file not found appears on STDOUT
stdout.each do |line|
	result = result + [line]
	if line.match(/(^(?:OK|FAIL)\n)|(^Stop.*)|(^File.*)/)
		stdin.puts("Quit")
	end
end

# consume stderr messages
errors = stderr.readlines

Process.waitall

# strio out command prompt
result = result.map {|s| s.gsub(/^>/, "")}

# find the test results
test_start = result.find_index { |line| line.match(/^.*\:(?:FAIL|PASS|IGNORE)/) }
test_status = result.find_index { |line| line.match(/^(?:OK|FAIL)\n/) }

# start and last will be missing if code causes an Exception
if test_start & test_status
	result = result[test_start , (test_status - test_start) + 1]
end

# Play back results and errors
result.each do | line |
	STDOUT.print line
end

errors.each do | line |
	STDERR.print line
end
