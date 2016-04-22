require 'json'
require 'rest-client'
require 'time'

rest_arr = Array.new
entry_arr = Array.new

File.open("servers.txt", "r") do |file|
  file.each_line do |line|
    rest_arr.push(line)
  end
end

rest_arr.each do |url|
  puts url
end

#loop begin
#response = RestClient.get 'XXXX'
#add response to array of hashes
#loop end

#loop begin (response array of hashes)
## parse response
log_entry = ""
t = Time.new
log_entry << t.iso8601
puts log_entry
## add "topology", "server", "status", "timestamp" (something like string builder in java)
## push to final array of strings
entry_arr.push(log_entry)
#loop end

if(!File.exist?(/userapps/logs/storm.log)) {
  File.new(/userapps/logs/storm.log)
}
log_file = File.open("/userapps/logs/storm.log", "w")
#loop begin
## write each string index (reprenting one log entry) to a file (same one that logstash is watching)
entry_arr.each do |log|
  #write to file
  log_file.write(log + "\n")
end
#loop end
log_file.close
