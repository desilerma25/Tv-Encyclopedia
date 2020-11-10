class API

    attr_accessor :query

    def initialize(query)
        @query = query
    end

    def self.start
        url = "http://api.tvmaze.com/shows/#{query}?embed[]=seasons&embed[]=episodes&embed[]=cast"
        uri = URI(url)
        response = Net::HTTP.get(uri)
        hash = JSON.parse(response)
        array_of_shows = hash["name"]
        # binding.pry 
    end
end