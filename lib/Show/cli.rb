class CLI

    @@shows = ["I Love Lucy", "The Twilight Zone", "Schitt's Creek", "Breaking Bad", "Game of Thrones"]


    def start
        puts "Welcome to the TV Encyclopedia!"
        sleep(1)
        puts "Would you like to view your television show options? Enter 'yes' to continue or 'no' to exit."
        user_input = gets.strip.downcase
        if user_input == "yes" || user_input == 'y'
        puts "Please choose a popular television show from the list that you'd like information on?"
        self.display_shows
        ask_for_user_second_input
        self.back_to_menu?
        elsif
            user_input == "no" || user_input == "n"
            puts "Thanks for channel surfing!"
        else
            puts "Hmmm, that wasn't right. Why don't we take it from the top?"
            sleep(2)
            self.start
        end
    end


    def ask_for_user_second_input
        index = self.initial_input
        if index.between?(0,4) 
            query = CLI.shows[index]
            api = API.new(query)
            x = api.create_shows
            display_show_details(x)
        else
            puts "Please select a valid number from the list (1-5)."
            self.ask_for_user_second_input
        end
    end

    def display_shows
        CLI.shows.each_with_index{|show, index| puts "#{index+1}. #{show.upcase}"}
    end

    def display_show_details(show)
        puts "#{show.name} -- Rating: #{show.rating}"
        puts "Genre(s): #{show.genres.join(", ")}"
        puts "Status: #{show.status}"
        puts "Summary: #{show.summary.gsub('<p>', '').gsub('</p>', '').gsub('<b>', '').gsub('</b>', '').gsub('<i>', '').gsub('</i>', '')}"
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
            puts "Thanks for channel surfing!"
        end
    end

  
end
