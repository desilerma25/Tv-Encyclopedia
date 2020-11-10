class API

    attr_accessor :query

    def initialize(query)
        @query = query
    end

    def fetch_shows
        url = "http://api.tvmaze.com/shows/#{query}?embed[]=seasons&embed[]=episodes&embed[]=cast"
        uri = URI(url)
        response = Net::HTTP.get(uri)
        hash = JSON.parse(response)
        array_of_shows = hash["name"]
        # binding.pry 
        array_of_shows.each do |show|
    end

    def create_shows
        self.fetch_shows.each{|show| Tv_Show.new(show["name"], show["status"], show["rating"], show["genres"], show["summary"], show["embedded"]["cast"], show["embedded"]["seasons"], show["embedded"]["episodes"])
    end
end