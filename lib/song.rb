require_relative './artist.rb'
require_relative './mp3_importer.rb'
require 'pry'

class Song
# attr_accessor :songs
@@all = []
     def initialize(name)
          @name = name
          self.class.all << self
     end

     def name=(name)
          @name = name
     end
     def name
          @name
     end
     def artist=(artist)
          @artist = artist
          @artist.songs << self unless @artist.songs.include?(self)
     end
     def artist
          @artist
     end
     def self.all 
          @@all
     end


     def self.new_by_filename(filename)
          #Michael Jackson - Black or White - pop.mp3
          file = filename.split(" - ").to_a
          song_name = file[1]
          song_artist = file[0]

          new_artist = Artist.find_or_create_by_name(song_artist)
          new_song = Song.new(song_name)

          new_song.artist=(new_artist)
          new_song
     end

     def artist_name=(artist)
          @artist=(Artist.find_or_create_by_name(artist))
          # found = self.all.find{|song| song.artist == artist}
          # if found.nil?
          #      found = Artist.new(artist)
          # end
          # found
     end
end
