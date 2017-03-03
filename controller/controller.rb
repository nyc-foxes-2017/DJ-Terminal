class Controller
  attr_reader :spotify, :view, :artist
  def initialize(args)
    @spotify = args.fetch(:spotify)
    @view = args.fetch(:view)
    @artist = args.fetch(:artist)
  end

  def run
    @view.welcome
    @artist = @view.get_artist
    spotify = Spotify.new(@artist)

  end
end
