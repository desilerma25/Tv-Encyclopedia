require 'pry'
class CLI

    @@shows = ["I Love Lucy", "The Twilight Zone", "Schitt's Creek", "Breaking Bad", "Game of Thrones"]

    def start
        puts "Welcome!"
        puts "What show would you like to see more information on?"
        self.display_shows
        index = self.initial_input
        query = CLI.shows[index]
        api = API.new(query)
        api.create_show
        Show.display_info_options
        index = self.secondary_input

        Show.display_info_details(index)
        self.another_show?
    end

    def input_to_index(input)
        input.to_i-1
    end

    def another_show?
        puts "Would you like information on a different show?"
        puts "1. Yes"
        puts "2. No"
        input = gets.chomp
        index = input_to_index(input)

        if index == 0
            Show.clear_all
            self.start
        end
    end

    def initial_input
        input = gets.chomp
        index = input_to_index(input)

        if !index.between?(0,4)
            puts "Please enter a valid option (a number between 1 and 5)."
            self.initial_input
        else
            index
        end
    end

    def secondary_input
        input = gets.chomp
        index = input_to_index(input)
        if !index.between?(0,4)
            puts "Please enter a valid option (a number between 1 and 5)."
            self.secondary_input
        else
            index
        end
    end

    def self.shows
        @@shows
    end

    def display_shows
        CLI.shows.each_with_index{|show, index| puts "#{index+1}. #{show.capitalize}"}
    end

end

puts "CLI"
