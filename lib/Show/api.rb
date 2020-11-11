

class API

    attr_accessor :query

    def initialize(query)
        @query = query
    end


    def self.fetch_info
        url = "http://api.tvmaze.com/search/shows?q=#{query}"
        uri = URI(url)
        response = Net::HTTP.get(uri)
        info = JSON.parse(response)
        
        info_instance = Show.new(query)
        # binding.pry
        info_instance.summary = info["summary"]
        info_instance.rating = info["rating"]
        info_instance.genres = info["genres"]
        info_instance.status = info["status"]
        info_instance.premiere = info["premiereDate"]
        
        # binding.pry
    end

  
end


puts "API"