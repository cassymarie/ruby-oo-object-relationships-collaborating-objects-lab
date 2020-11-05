require_relative './song.rb'
require_relative './mp3_importer.rb'
require 'pry'

class Artist
@@all = []
     def initialize(name)
          @name = name
          @songs = []
          self.class.all << self
     end

     def name=(name)
          @name = name
     end
     def name
          @name
     end
     def songs=(song)
          @songs << song
          song.artist = self if song.artist.nil?
     end
     def songs
          @songs
     end
     def add_song(song)
          @songs << song unless @songs.include?(song)
     end

     def self.all 
          @@all
     end

     def self.find_or_create_by_name(name)

          found = self.all.find{|artist| artist.name == name}
          if found.nil?
               found = Artist.new(name)
          end
          found
     end

     def self.artist_names
          self.all.collect{|artist| artist.name}
     end

     def self.find_by_name?(name)
          self.all.collect{|artist| artist == name}.include?(name)     
     end
     
     def print_songs
          @songs.collect{|song| puts song.name}
     end
end
