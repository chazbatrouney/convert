#!/usr/bin/env ruby

require File.expand_path(File.dirname(__FILE__) + '/binaries')

INPUT_DIR = ARGV[0]

Dir.glob("#{INPUT_DIR}/*.mov").each do |file|
  command = "'#{MODMOVIE}' '#{file}' -self-contained -save-in-place -notrack 'Sound Track 1' -notrack 'Video Track 1'"

  puts command
  system command
end
