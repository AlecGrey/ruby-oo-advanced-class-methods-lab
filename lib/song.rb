require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  # ~~ class methods ~~ #

  def self.all
    @@all
  end

  def self.create
    song = Song.new
    song.save
    return song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    return song
  end

  def self.create_by_name(name)
    song = self.new_by_name(name)
    song.save
    return song
  end

  def self.find_by_name(name)
    @@all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      return self.find_by_name(name)
    else
      return self.create_by_name(name)
    end
  end

  def self.alphabetical
    return @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    arr = filename.split(" - ")
    arr[1].slice!(".mp3")
    song = self.find_or_create_by_name(arr[1])
    song.artist_name = arr[0]
    song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
  end

  def self.destroy_all
    @@all = []
  end

  # ~~ instance methods ~~ #
  
  def save
    self.class.all << self
  end

end
