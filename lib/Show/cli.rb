# require 'pry'
class CLI

    @@shows = ["I Love Lucy", "The Twilight Zone", "Schitt's Creek", "Breaking Bad", "Game of Thrones"]


    def start
        puts "Welcome!"
        sleep(1)
        puts "Would you like to see information on a popular television show?"
        puts "Type 'yes' to continue"
        user_input = gets.strip.downcase
        if user_input == "yes" || user_input == "y"
            puts "Great! Which show do you want to see more about?"
            display_list_of_shows
            ask_user_for_show # stuck here
        else
            puts "Thanks for exploring!"
        end
    end

    def ask_user_for_show
        input = gets.strip
        index = input_to_index(input)

        if !index.between?(0,4)
            puts "Please select a valid option."
            index = gets.strip.to_i-1
        # max_limit = Show.all.length-1
        # until index.between?(0,max_limit)
        #     puts "Sorry that is not a valid option." ##endless loop!!!
        end
        show_instance = Show.all[index]
        display_show_details(show_instance)
    end

    def input_to_index(input)
        input.to_i - 1
    end

    def display_list_of_shows
        CLI.shows.each_with_index{|show, index| puts "#{index+1}. #{show.upcase}"}
        # Show.all.each_with_index(1) do |show, index|
        #     puts "#{index}. #{show.name}"
        # end
    end

    def display_show_details(show)
        sleep(1)
        puts "\n"
        puts "\nName: " + show.name
        puts "\nRating: " + show.rating
        puts "\nSummary: " + show.summary
        puts "\nGenres: " + show.genres
        puts "\nStatus: " + show.status
    end

    def self.shows
        @@shows
    end
   
end

puts "CLI"
