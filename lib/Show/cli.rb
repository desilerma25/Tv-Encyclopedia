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
        # index = gets.strip.to_i-1
        # max_limit = Show.all.length-1
        # until index.between?(0,max_limit)
        #     puts "Sorry that is not a valid option." ##endless loop!!!
        end
        show_instance = Show.all[index]
        display_show_details(show_instance)
    end

    def display_list_of_shows
        CLI.shows.each_with_index{|show, index| puts "#{index+1}. #{show.capitalize}"}
        # Show.all.each_with_index(1) do |show, index|
        #     puts "#{index}. #{show.name}"
        # end
    end

    def display_show_details(show)
        sleep(1)
        puts "\n"
        puts show.name
        puts "\nRating: " + show.rating
        puts "\nSummary: " + show.summary
        puts "\nGenres: " + show.genres
        puts "\nStatus: " + show.status
    end

    def self.shows
        @@shows
    end
    # def start
    #     puts "Welcome!"
    #     API.fetch_info
    #     self.menu
    # end

    # def menu
    #     puts "Would you like to see a list of popular television shows?"
    #     puts "Type 'yes' to continue or any key to exit."
    #     user_input = gets.strip.downcase
    #     if user_input == "yes" || user_input == "y"
    #         puts "Great!!"
    #         self.display_shows
    #         ask_user_for_show
    #         sleep(1)
    #         menu
    #     else
    #         puts "Thank you for exploring!"
    #         binding.pry
    #     end
    # end
        
    # def ask_user_for_show
    #     index = gets.chomp.to_i-1
    #     max = Show.all.length-1
    #     until index.between?(0,max)
    #         puts "Please enter a valid option (a number between 1 and 5)."
    #         index = gets.chomp.to_i-1
    #     end
    #     show_instance = Show.all[index]
    #     Show.display_show_details(show_instance)
    # end


    # def display_show_details(show)
    #     sleep(1)
    #     puts "\n"
    #     puts show.name
    #     puts "\nRatings:" + show.ratings
    #     puts "\nGenres:" + show.genres
    #     puts "\nStatus:" + show.status
    #     puts "\nSummary:" + show.summary
    # end

    # def self.shows
    #     @@shows
    # end

    # def display_shows
    #     self.shows.each_with_index do |show, index|
    #         puts "#{index+1}. #{show.name}"
    #     end
    #     # CLI.shows.each_with_index{|show, index| puts "#{index+1}. #{show.capitalize}"}
    # end

end

puts "CLI"
