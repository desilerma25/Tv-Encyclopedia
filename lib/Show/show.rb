
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

    def self.clear_all
        @@all = []
    end

    def self.display_info_options
        puts "Please choose a television show you'd like more information on: (1-5)"
        self.all.each_with_index{|show, index| puts "#{index+1}. #{show.name}"}
    end

    def self.display_show_details(index)
        show = self.all[index]
        puts "#{show.name} -- #{show.rating}"
        puts "#{show.genres}"
        puts "#{show.status}"
        puts "#{show.summary}"
    end

end
# binding.pry
puts "Tv Shows"