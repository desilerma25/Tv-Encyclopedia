class API

    def fetch_info
        url = "http://api.tvmaze.com/shows/526?embed[]=seasons&embed[]=episodes&embed[]=cast"
        uri = URI(url)
        response = Net::HTTP.get(uri)
        hash = JSON.parse(response)
        array_of_info = hash["info"]
        # binding.pry 
        array_of_info.each do |info_hash|
            info_instance = Info.new(name: info_hash["name"])
            info_instance.summary = info_hash["summary"]
            info_instance.rating = info_hash["rating"]["average"]
            info_instance.genres = info_hash["genres"]
        end
    end

   
   


end

puts "API"

# api = API.new("hello")
# binding.pry
# "let us pry"