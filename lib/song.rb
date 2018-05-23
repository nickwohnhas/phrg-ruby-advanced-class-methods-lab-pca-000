require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def initialize


  end

  def self.create
    song = self.new
    @@all << song
    song
  end


  def self.new_by_name(name)
    song = self.new
    song.name = name

    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(name)
    self.all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) != nil
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    empty_array = []
    self.all.sort! { |a, b|  a.name <=> b.name }
    self.all
  end

  def self.new_from_filename(file_name)
    new_file_name = file_name.slice(0,file_name.length - 4)
    file_name_array = new_file_name.split("-")
    song = self.new

    song.name = file_name_array[1].strip
    song.artist_name = file_name_array[0].strip
    song
  end

  def self.create_from_filename(file_name)
    new_file_name = file_name.slice(0,file_name.length - 4)
    file_name_array = new_file_name.split("-")
    song = self.new

    song.name = file_name_array[1].strip
    song.artist_name = file_name_array[0].strip
    self.all << song
  end

  def self.destroy_all
    self.all.clear
  end
end
