def find_binary(name)
  system = `which #{name}`.strip
  
  system != '' ? system : File.expand_path(File.dirname(__FILE__) + "/Resources/#{name}")
end

HANDBRAKE = find_binary('HandBrakeCLI') + ' -Z "Apple TV Custom"'
MUXMOVIE  = find_binary 'muxmovie'
MODMOVIE  = find_binary 'modmovie'