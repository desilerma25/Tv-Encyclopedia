

class API

    attr_accessor :query

    def initialize(query)
        @query = query
    end


    def fetch_info
        url = "http://api.tvmaze.com/search/shows?q=#{@query}"
        uri = URI(url)
        response = Net::HTTP.get(uri)
        info = JSON.parse(response)
        
        # binding.pry
    end

    def create_shows
        show = self.fetch_info[0]
        x = Show.new(show["show"]["name"], show["show"]["rating"]["average"], show["show"]["summary"], show["show"]["genres"], show["show"]["status"])
        # binding.pry
    end
end
