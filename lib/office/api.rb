

class API

    def self.fetch_info
        url = "http://api.tvmaze.com/shows/526"
        uri = URI(url)
        response = Net::HTTP.get(uri)
        hash = JSON.parse(response)
        array_of_info = hash.to_a
        # binding.pry 
        array_of_info.each do |info_hash|
            info_instance = Office.new(name: info_hash[2])
            info_instance.summary = info_hash[17]
            info_instance.rating = info_hash[11] #[1]
            info_instance.genres = info_hash[5]
        end
    end
end

# API.fetch_info
puts "API"


    # def self.fetch_info
    #     url = "http://api.tvmaze.com/shows/526"
    #     uri = URI(url)
    #     response = Net::HTTP.get(uri)
    #     hash = JSON.parse(response)
    #     array_of_info = hash[]
    #     # binding.pry 
    #     array_of_info.each do |info_hash|
    #         info_instance = Office.new(name: info_hash["name"])
    #         info_instance.summary = info_hash["summary"]
    #         info_instance.rating = info_hash["rating"]["average"]
    #         info_instance.genres = info_hash["genres"]
    #     end
    # end
   
   




# api = API.new("hello")
# binding.pry
# "let us pry"