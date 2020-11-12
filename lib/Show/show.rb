class Show

    attr_accessor :name, :rating, :summary, :genres, :status

    @@all = []
    
    def initialize(name, rating, summary, genres, status)
        @name = name
        @rating = rating
        @summary = summary
        @genres = genres
        @status = status
        @@all << self
    end

    def self.all
        @@all
    end



end
