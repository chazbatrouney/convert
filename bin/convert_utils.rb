require 'ftools'
require 'fileutils'

# make sure the dirs exist to move file name from inside from to the equivalent
# position inside to
#   e.g. from/a/b/c.txt -> to/a/b/c.txt
def clone_path(filename, from, to, new_ext = nil)
  # strip the relevant part of the path from the filename
  # will throw an exception if the path doesn't start with from...
  old_path, basename = File.split(filename)
  path = old_path.match("#{from}(.*)")[1]  
  new_path = File.join(to, path)
  
  # ensure that new_path exists
  File.makedirs new_path
  
  # return the 'new' file name
  File.join(new_path, new_ext ? basename.sub(/\.[^\.]*$/, new_ext) : basename )
end


def move_file(in_file, from_dir, to_dir)
  new_file = clone_path(in_file, from_dir, to_dir)
  puts "Moving #{in_file} to #{new_file}"
  File.move(in_file, new_file, false)
  
  new_file
end

def stage_file(in_file)
  move_file(in_file, INPUT_DIR, STAGING_DIR)
end

def convert_file(in_file)
  out_file = clone_path(in_file, STAGING_DIR, VIDEO_DIR, '.m4v')
  puts "Converting #{in_file} => #{out_file}"
  
  # muxmovie doesn't give us any nice error status, so lets hope it doesn't print nothing
#   command = "#{MUX_MOVIE} -self-contained #{NOTHING} "#{in_file}" -o "#{out_file}" 2>&1"

  command = "#{HANDBRAKE} -i '#{in_file}' -o '#{out_file}' 2>&1"

  puts command
  if system command
    FileUtils.rm(in_file)
  else
    puts "Error converting #{in_file}.. skipping"
  end
  
  out_file
end

# delete all the empty directories out of the dir
def clean_dir(dir)
  Dir.glob(File.join(dir, '*')).each {|d| clean_dir(d); Dir.rmdir(d) rescue nil}
end
