require_relative './artist.rb'
require_relative './mp3_importer.rb'
require 'pry'

class MP3Importer
attr_accessor :path, :files
@@library = []

     def initialize (filepath)
          @path = filepath
          @files = []   
          self.class.all << self
          Dir::foreach(@path){|file|@files << file if file.include?(".mp3")}
     end

     def files
          @files
     end

     def import
          @files.collect{|file| Song.new_by_filename((file.split(" - "))[1])}
     end

     def self.all
          @@library
     end


end
