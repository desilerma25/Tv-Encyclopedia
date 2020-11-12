

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
        
        # show_instance = Show.new(query)
        
        # show_instance.summary = info["summary"]
        # show_instance.rating = info["rating"]
        # show_instance.genres = info["genres"]
        # show_instance.status = info["status"]
        # binding.pry
    end

    def create_shows
        self.fetch_info.each{|show| Show.new(show["name"], show["ratings"], show["summary"], show["genres"], show["status"])} 
    end
end
