class API

    def fetch_info
        url = "http://api.tvmaze.com/shows/526?embed[]=seasons&embed[]=episodes&embed[]=cast"
        uri = URI(url)
        response = Net::HTTP.get(uri)
        hash = JSON.parse(response)
        array_of_info = hash["info"]
        # binding.pry 
        array_of_info.each do |info|
        end
    end

    def create_info
        self.fetch_info.each{|info| Info.new(info["name"], info["status"], info["rating"], info["genres"], info["summary"], info["embedded"]["cast"], info["embedded"]["seasons"], info["embedded"]["episodes"])}
    end


end

puts "API"

# api = API.new("hello")
# binding.pry
# "let us pry"