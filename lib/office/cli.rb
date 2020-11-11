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
        user_input = gets.chomp.downcase
        if user_input == "yes" || "y"
            puts "Great! What would you like to know about?"
            display_list_of_options
            ## Stuck here!! App leaves off at 1. Rating... cannot accept user input
            index = self.initial_input
            ask_user_what_info
            sleep(1)
            menu
        elsif user_input == search

            menu
        else
            puts "Hope you enjoyed some nuggest of information!"
        end
    end

    def initial_input
        input = gets.chomp
        index = input_to_index
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

    # def display_info_details(info)
    #     sleep(1)
    #     puts "\nRating:" + info_instance.rating
    #     puts "\nSummary:" + info_instance.summary 
    #     puts "\nGenres:" + info_instance.genres 
    # end

    def display_list_of_options
        # Office.all.each.with_index(1) do  
       puts "1. Rating"
       puts "2. Summary"
       puts "3. Genres"
       input = gets.chomp
       index = input_to_index(input)
    end

    def input_to_index(input)
        input.to_i-1
    end

end

puts "CLI"
