# require 'pry'
class CLI

    @@shows = ["I Love Lucy", "The Twilight Zone", "Schitt's Creek", "Breaking Bad", "Game of Thrones"]


    def start
        puts "Welcome!"
        sleep(1)
        puts "Would you like to see information on a popular television show?"
        puts "Type 'yes' to continue."
        user_input = gets.strip.downcase
        if user_input == "yes" || user_input == "y"
            puts "Great! Which show do you want to see more about?"
            self.display_shows
            index =self.initial_input
            query = API.new(query)
            API.create_shows
            Show.display_show_details(index)
            self.back_to_menu?
        else
            puts "Thanks for exploring!"
        end
    end

    def display_shows
        CLI.shows.each_with_index{|show, index| puts "#{index+1}. #{show.upcase}"}
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
        puts "Type 'yes' to continue."
        user_input = gets.strip.downcase
        if user_input == "yes" || user_input == "y"
            self.start
        else
            "Thanks for exploring!"
        end
    end

  
end

puts "CLI"
