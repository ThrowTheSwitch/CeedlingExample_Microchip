# OUT_FILE = "test/simulation/out.txt"
# File.delete OUT_FILE if File.exists? OUT_FILE
# IO.popen("sim30 test/simulation/sim_instructions.txt")
# sleep 1
# if File.exists? OUT_FILE
#     file_contents = File.read OUT_FILE
#     print file_contents
# end

require 'rbconfig'

OUT_FILE = "./test/simulation/out.txt"

File.delete OUT_FILE if File.exists? OUT_FILE

# this_os = RbConfig::CONFIG['host_os']

# if (this_os =~ /mswin|mingw|cygwin/)
    # var = IO.popen("c:\\Program Files (x86)\\Microchip\\MPLABX\\mplab_ide\\bin>mdb.bat ./test/simulation/sim_instructions.txt > " + OUT_FILE)
# elsif (this_os =~ /darwin1[[:digit:]]/)
var = IO.popen("/Applications/microchip/mplabx/v6.05/mplab_platform/bin/mdb.sh  ./test/simulation/sim_instructions.txt")
    # var = "/Applications/microchip/mplabx/v6.05/mplab_platform/bin/mdb.sh  ./test/simulation/sim_instructions.txt"
# end

result = var.readlines
Process.waitall


if File.exists? OUT_FILE
    file_contents = File.read OUT_FILE
    print file_contents
else
    print result

end
