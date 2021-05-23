class Show

    attr_accessor :name, :rating, :summary, :genres, :status, :favorite

    @@all = []
    
    def initialize(name, rating, summary, genres, status, favorite = false)
        @name = name
        @rating = rating
        @summary = summary
        @genres = genres
        @status = status
        @favorite = favorite
        @@all << self
    end

    def self.all
        @@all
    end

    def self.find_by_name(name)
        @@all.find {|show| show.name == name}
    end

    def self.find_favorite
        @@all.select {|show| show.favorite == true}
    end


end
