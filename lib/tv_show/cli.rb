class CLI

    @@shows = ["The Wire", "The Sopranos", "The Twilight Zone", "Breaking Bad", "I Love Lucy"]

    def start
        puts "Welcome! Curious about popular television shows? Let me help!"
        puts "Please select one of the following highly popular television shows to view more information on them."
        self.display_shows
        Show.display_shows
        index = self.secondary_input

        Show.display_show(index)
        self.another_show?
    end

    def input_to_index(input)
        input_to_i -1
    end

    def another_show?
        puts "Would you like to view information on another popular show?"
        puts "Yes"
        puts "No"
        input = gets.chomp
        index = input_to_index(input)
    end
end
