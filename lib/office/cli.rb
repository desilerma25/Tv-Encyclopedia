require 'pry'
class CLI
    def start
        puts "Welcome!"
        API.fetch_info
        menu
    end

    def menu
        puts "Would you like to learn more about The Office (U.S)?"
        puts "Type 'yes' to proceed or select another key to exit."
        if user_input == "yes" || "y"
            puts "Great! What would you like to know about?"
            display_options
            ask_user_what_info
            sleep(1)
            menu
        elsif user_input == search

            menu
        else
            puts "Hope you enjoyed some nuggest of information!"
        end
    end

    def user_input
    end

    def ask_user_what_info
        index = gets.chomp.to_i-1
        max_limit = Office.all.length-1
        until index.between?(0,max_limit)
            puts "Sorry I don't understand what you were trying to select."
            index = gets.chomp.to_i-1
        end
        info_instance = Office.all[index]
        display_info_details(info_instance)
    end

    def display_info_details(info)
        sleep(1)
        puts "\nRating:" + info.rating
        puts "\nSummary:" + info.summary 
        puts "\nGenres:" + info.genres 
    end

    def display_list_of_options
        Office.all.each.with_index(1) do |info, index|
            puts "#{index}. #{info.rating}"
            puts "#{index}. #{info.summary}"
            puts "#{index}. #{info.genres}"
        end
    end


end

puts "CLI"
