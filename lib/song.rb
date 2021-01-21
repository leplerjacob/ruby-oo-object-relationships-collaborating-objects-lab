class Song
    attr_accessor :name, :artist
    @@all = []
    def initialize(name)
        @name = name
        save
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end

    def self.new_by_filename(filename)
        song,artist = filename.split(" - ")
        new_song = self.new(song)
        new_song.artist_name = artist
        new_song
    end

    def artist=(artist_as_string)
        art = Artist.find_or_create_by_name(artist_as_string)
        art.add_song(self)
    end

end