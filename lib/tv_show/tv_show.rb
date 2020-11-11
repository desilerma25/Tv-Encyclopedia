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

    def self.display_shows
        puts "Please choose one of the shows: (1-5)"
        self.all.each_with_index{|show, index| puts "#{index + 1}. #{show.name}"}
    end

    def self.display_show(index)
        show = self.all[index]
        puts "#{show.name} -- #{show.status} -- #{show.rating}"
        puts "#{show.summary}"

        puts "Would you like to see more information on this show?"
        puts "1. Yes"
        puts "2. No"

        input = gets.chomp
        index = input.to_i - 1

        if index == 0
            puts "What information would you like to see?"
            puts "1. Cast"
            puts "2. Seasons"
            puts "3. Episodes"
        end
    end


    
end

puts "Tv Show"