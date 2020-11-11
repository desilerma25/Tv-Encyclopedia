

class API

    attr_accessor :query

    def initialize(query)
        @query = query
    end


    def self.fetch_info
        url = "http://api.tvmaze.com/search/shows?q=#{@query}"
        uri = URI(url)
        response = Net::HTTP.get(uri)
        info = JSON.parse(response)
        
        # info_instance = Show.new(query)
        
        # info_instance.summary = info["summary"]
        # info_instance.rating = info["rating"]
        # info_instance.genres = info["genres"]
        # info_instance.status = info["status"]
    end

    def create_show
        self.fetch_info.each{|show| Show.new(show["name"], show["ratings"], show["summary"], show["genres"], show["status"])}
    end
end


puts "API"