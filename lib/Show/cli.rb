# require 'pry'
class CLI

    @@shows = ["I Love Lucy", "The Twilight Zone", "Schitt's Creek", "Breaking Bad", "Game of Thrones"]


    def start
        puts "Welcome!"
        sleep(1)
        puts "Please choose a popular television show you'd like information on?"
        self.display_shows
        # add case statement in here?
        index = self.initial_input
        query = CLI.shows[index]
        api = API.new(query)
        x = api.create_shows
        display_show_details(x)
        self.back_to_menu?
    end

    def display_shows
        CLI.shows.each_with_index{|show, index| puts "#{index+1}. #{show.upcase}"}
    end

    def display_show_details(show)
        puts "#{show.name} -- #{show.rating}"
        puts "#{show.genres}"
        puts "#{show.status}"
        puts "#{show.summary}"
    end

    def self.shows
        @@shows
    end

    def input_to_index(input)
        input.to_i - 1
    end

    def initial_input
        input = gets.chomp
        index = input_to_index(input)
    end

    def back_to_menu?
        puts "Would you like to return to the main menu?"
        puts "Type 'yes' to continue or another key to exit."
        user_input = gets.strip.downcase
        if user_input == "yes" || user_input == "y"
            self.start
        else
            puts "Thanks for exploring!"
        end
    end

  
end
