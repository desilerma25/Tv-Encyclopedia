class Tv_Show

    attr_accessor :id, :name, :rating, :summary

    @@all = []
    
    def initialize(id, name, rating, summary)
        @id = id
        @name = name
        @rating = rating
        @summary = summary
        @@all << self
    end

    def self.all
        @@all
    end
    
end