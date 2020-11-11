# require 'pry'
class CLI

    @@shows = ["I Love Lucy", "The Twilight Zone", "Schitt's Creek", "Breaking Bad", "Game of Thrones"]

    def start
        puts "Welcome!"
        API.fetch_info
        self.menu
    end

    def menu
        puts "Would you like to see a list of popular television shows?"
        puts "Type 'yes' to continue or any key to exit."
        user_input = gets.strip.downcase
        if user_input == "yes" || user_input == "y"
            puts "Great!!"
            display_shows
            ask_user_for_show
            sleep(1)
            menu
        else
            puts "Thank you for exploring!"
            binding.pry
        end
    end
        
    def ask_user_for_show
        index = gets.chomp.to_i-1
        max = Show.all.length-1
        until index.between?(0,max)
            puts "Please enter a valid option (a number between 1 and 5)."
            index = gets.chomp.to_i-1
        end
        show_instance = Show.all[index]
        Show.display_show_details(show_instance)
    end


    def display_show_details(show)
        sleep(1)
        puts "\n"
        puts show.name
        puts "\nRatings:" + show.ratings
        puts "\nGenres:" + show.genres
        puts "\nStatus:" + show.status
        puts "\nSummary:" + show.summary
    end



    def display_shows
        Show.all.each_with_index(1) do |show, index|
            puts "#{index}. #{show.name}"
        end
        # CLI.shows.each_with_index{|show, index| puts "#{index+1}. #{show.capitalize}"}
    end

end

puts "CLI"
