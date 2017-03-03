require 'open-uri'
require 'pry'
require 'json'
gem 'rspotify'

BASE_URL = 'https://api.spotify.com/'

def search(name)
  if name.split(" ").length > 1
    name = name.split(" ")
    name = name.join('%20')
    json_string_response = open(BASE_URL + "v1/search?q=" + name + '&type=artist').read
  else
    json_string_response = open(BASE_URL + "v1/search?q=" + name + '*&type=artist' ).read
  end
end

def get_artist(artist)
  a = JSON.parse(search(artist))["artists"]["items"][0]["id"]
end

def tracks(artist)
  id = get_artist(artist)
  # binding.pry
  a = open(BASE_URL + "v1/artists/#{id}/top-tracks?country=US").read
  JSON.parse(a)
  # binding.pry
end

def grab_tracks(artist)
  list = tracks(artist)
  i = 0
  songs = []
  while i < list["tracks"].length
    songs << list["tracks"][i]["name"]
    puts list["tracks"][i]["name"]
    i += 1
  end
  songs
end



puts "Name an artist and we will give you the top tracks."
artist = gets.chomp
grab_tracks(artist)


