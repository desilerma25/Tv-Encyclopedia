class Tv_Show

    attr_accessor :name, :status, :rating, :summary, :cast, :seasons, :episodes

    @@all = []
    
    def initialize(name, status, rating, summary, cast, seasons, episodes)
        @name = name
        @status = status
        @rating = rating
        @summary = summary
        @cast = cast
        @seasons = seasons
        @episodes = episodes
        @@all << self
    end

    def self.all
        @@all
    end
    
end

puts "Tv Show"