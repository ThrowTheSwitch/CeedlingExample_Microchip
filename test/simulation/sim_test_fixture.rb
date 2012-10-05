OUT_FILE = "test/simulation/out.txt"
File.delete OUT_FILE if File.exists? OUT_FILE 
IO.popen("sim30 test/simulation/sim_instructions.txt")
sleep 1
if File.exists? OUT_FILE 
    file_contents = File.read OUT_FILE
    file_contents.gsub!("\n", "")
    print file_contents
end