module View
  def self.display(stuff)
    puts stuff
  end

  def self.welcome
    puts "DJ Terminal welcomes you! Get ready to get the top tracks."
  end

  def self.get_artist
    puts "Please name an artist: "
    gets.chomp
  end

end
