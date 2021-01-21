class Artist
    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
        # binding.pry
    end

    def self.all
        @@all
    end

    def add_song(song)
        song.artist(self)
        binding.pry
    end

    def songs   
       Song.all.select{|song| song.artist == self}
    end

    def self.find_or_create_by_name(artist_name)
        found_artist = self.all.select{|artist| artist.name == artist_name}.first
        !found_artist ? self.new(artist_name) : found_artist
    end

    def print_songs
        songs
    end

end