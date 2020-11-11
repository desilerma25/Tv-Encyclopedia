require 'pry'
class Office

    attr_accessor :name, :rating, :summary, :genres

    @@all = []
    
    def initialize(name)
        @name = name
        # @rating = rating
        # @summary = summary
        # @genres = genres
        @@all << self
    end

    def self.all
        @@all
    end

end
# binding.pry
puts "The Office"