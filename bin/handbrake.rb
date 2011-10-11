#!/usr/bin/env ruby

require File.expand_path(File.dirname(__FILE__) + '/binaries')

INPUT_DIR = ARGV[0]

Dir.glob("#{INPUT_DIR}/*.*").each do |in_file|
  next unless in_file =~ /\.(avi|mkv|mov)$/
  
  out_file = in_file.sub($1, 'm4v')
   
  command = "#{HANDBRAKE} -i \"#{in_file}\" -o \"#{out_file}\""

  puts command
  system command
end
