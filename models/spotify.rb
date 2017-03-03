class Spotify
  attr_reader :artist
  def initialize(artist)
    @artist = artist
  end

  def search
    if @artist.split(" ").length > 1
      split_artist = @artist.split(" ")
      split_artist = split_artist.join('%20')
      json_string_response = open("https://api.spotify.com/v1/search?q=" + split_artist + '&type=artist').read
    else
      json_string_response = open("https://api.spotify.com/v1/search?q=" + split_artist + '*&type=artist' ).read
    end

  end

  def get_artist
    JSON.parse(search()["artists"]["items"][0]["id"])
  end

  def tracks
    id = get_artist
    # binding.pry
    a = open('https://api.spotify.com/' + "v1/artists/#{id}/top-tracks?country=US").read
    JSON.parse(a)
    # binding.pry
  end

  def grab_tracks
    list = tracks
    i = 0
    songs = []
    while i < list["tracks"].length
      songs << list["tracks"][i]["name"]
      puts list["tracks"][i]["name"]
      i += 1
    end
    songs
  end

end

