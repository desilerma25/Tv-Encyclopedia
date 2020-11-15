class CLI
puts "            o "
puts "   o       / "
puts '    \     / '
puts '     \   / '
puts '      \ / '
puts "+--------------v-------------+"
puts "|  __________________      @ |"
puts "| /                  \        |"
puts '| |                  |  (\)  |'
puts "| |                  |       |"
puts "| |                  |  (-)  |"
puts "| |                  |       |"
puts '| \                  / :|||: |'
puts "|  -ooo--------------  :|||: |"
puts "+----------------------------+"
puts "  []                    []"

    @@shows = ["I Love Lucy", "The Twilight Zone", "Schitt's Creek", "Breaking Bad", "Game of Thrones", "The Voice", "Criminal Minds", "How I Met Your Mother", "The Walking Dead", "Sons of Anarchy", "The Colbert Report", "The Biggest Loser"]
    @@favorite_shows = []

    def start
        puts "Welcome to the TV Encyclopedia!"
        sleep(1)
        puts "Would you like to view your television show options? Enter 'yes' to continue, 'no' to exit or 'view' to see your saved favorites."
        user_input = gets.strip.downcase
        if user_input == "yes" || user_input == 'y'
        puts "Please choose a popular television show from the list that you'd like information on."
        self.display_shows
        ask_for_user_second_input
        self.back_to_menu?
        elsif user_input == "no" || user_input == "n"
            puts "Thanks for channel surfing!"
        elsif user_input == "view"
            view_favorites
        else
            puts "Hmmm, that wasn't right. Why don't we take it from the top?"
            sleep(2)
            self.start
        end
    end

    def view_favorites
        if @@favorite_shows.empty?
            puts "It appears you have not saved any shows yet."
            sleep(1)
            back_to_menu?
        else
            puts "Here are your favorite shows!"
            puts "#{@@favorite_shows.join(", ")}"
            sleep(1)
            back_to_menu?
        end
    end


    def ask_for_user_second_input
        index = self.initial_input
        if index.between?(0,11) 
            query = CLI.shows[index]
            api = API.new(query)
            x = api.create_shows
            display_show_details(x)
            sleep(1)
            save_favorite(x)
        else
            puts "We interrupt this program because that was not a valid option. Please select a valid number from the list (1-12)."
            self.ask_for_user_second_input
        end
    end

    def save_favorite(x)
        puts "Would you like to add this show to your favorites?"
        puts "Type 'yes' to save, 'no' to continue or 'exit' to leave." 
        input = gets.strip.downcase
        if input == "yes" || input == "y"
            @@favorite_shows << x.name.to_s
            puts "This show is now in your Favorites"
        elsif input == "no" || input == "n"
            puts "That's ok!! Maybe you'll find another show you're interested in."
        elsif input == "exit"
            puts "Thanks for channel surfing!"
        else
            puts "We interrupt this program because that was not a valid option. Please try again."
            input = gets.strip.downcase
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
