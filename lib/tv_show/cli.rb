class CLI

    @@shows = ["The Wire", "The Sopranos", "The Twilight Zone", "Breaking Bad", "I Love Lucy"]

    def start
        puts "Welcome! Curious about popular television shows? Let me help!"
        puts "Please select one of the following highly popular television shows to view more information on them."
        self.display_shows
        index = self.initial_input
        query = CLI.shows[index]
        api = API.new(query)
        api.create_shows
        Tv_Show.display_shows
        index = self.secondary_input

        Tv_Show.display_shows(index)
        self.more_info?
        self.another_show?
    end

    def input_to_index(input)
        input_to_i -1
    end

    def more_info?
        puts "Would you like to look at more details about this show?"
        puts "1. Yes"
        puts "2. No"
        input = gets.chomp
        puts "Would you like information on the cast, seasons, or episodes?"
        display_more_options # create this method, 
        input = gets.chomp
        input.each do |option|


    end

    def another_show?
        puts "Would you like to view information on another popular show?"
        puts "1. Yes"
        puts "2. No"
        input = gets.chomp
        index = input_to_index(input)
    end

    def initial_input
        input = gets.chomp
        index = input_to_index(input)

        if !index.between?(0,4)
            puts "Please select a valid option from the menu."
            self.initial_input
        else
            index
        end
    end

    def secondary_input
        input = gets.chomp


    def self.shows
        @@shows
    end

    def display_shows
        CLI.topics.each_with_index{|show, index| puts "#{index+1}. #{show.capitalize}"}
    end
end

puts "CLI"
