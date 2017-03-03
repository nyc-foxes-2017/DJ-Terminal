require_relative 'spotify'
require_relative 'view/view'
require_relative 'controller/controller'
require_relative 'models/spotify'


spotify = Spotify.new("rihanna")
p spotify.grab_tracks
