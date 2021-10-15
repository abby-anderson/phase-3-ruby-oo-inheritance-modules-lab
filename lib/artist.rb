require 'pry'

class Artist

  extend Memorable

  # user can read and write name
  attr_accessor :name
  # user can only read songs
  attr_reader :songs

  @@artists = []

  def initialize
    @@artists << self
    @songs = []
  end

  # detect returns the first artist where the condition is met
  # which in this case is the artist name matching the name provided in the method call
  def self.find_by_name(name)
    @@artists.detect{|a| a.name == name}
  end

  def self.all
    @@artists
  end

  # def self.reset_all
  #   self.all.clear
  # end

  # def self.count
  #   self.all.count
  # end

  def add_song(song)
    @songs << song
    song.artist = self
  end

  def add_songs(songs)
    songs.each { |song| add_song(song) }
  end

  # if the name has spaces in it, this just adds dashes instead, and 
  def to_param
    name.downcase.gsub(' ', '-')
  end
end
