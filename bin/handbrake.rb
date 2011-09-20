#!/usr/bin/env ruby

INPUT_DIR = ARGV[0]
HANDBRAKE = 'Resources/HandBrakeCLI -Z "Apple TV Custom"'

Dir.glob("#{INPUT_DIR}/*.*").each do |in_file|
  next unless in_file =~ /\.(avi|mkv|mov)$/
  
  out_file = in_file.sub($1, 'm4v')
   
  command = "#{HANDBRAKE} -i '#{in_file}' -o '#{out_file}'"

  puts command
  system command
end
