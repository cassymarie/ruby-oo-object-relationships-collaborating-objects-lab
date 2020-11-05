require_relative './artist.rb'
require_relative './mp3_importer.rb'
require_relative './song.rb'
require 'pry'

def reload!
  load './artist.rb'
  load './mp3_importer.rb'
  load './song.rb'
end

adele = Artist.new("Adele")
hello = Song.new("Hello")
goodbye = Song.new("Goodbye")
adele.add_song(hello)
queen = Artist.new("Queen")
boho = Song.new("Bohemien Rapsody")
rock_you = Song.new("We will Rock You")
queen.add_song(rock_you)
test_music_path = "./spec/fixtures/mp3s"
music = MP3Importer.new(test_music_path)
 binding.pry
adele.name
