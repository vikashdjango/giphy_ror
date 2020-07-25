class GraphicsController < ApplicationController
    def index
        @result, @count = top_trending, search.count
        return unless params[:search]
        @result, @count = giphy_search(params[:search]), search.count
      end
    
      def top_trending
        response = HTTParty.get("http://api.giphy.com/v1/gifs/trending?api_key=#{GIPHY_KEY}&limit=9")
        response['data']
      end
    
      def giphy_search(query)
        response = HTTParty.get("http://api.giphy.com/v1/gifs/search?api_key=#{GIPHY_KEY}&limit=9&q=#{query}")
        search.update!(count: (search.count + 1))
        return response['data']
      end
    
      def search
        Search.first
      end
end
