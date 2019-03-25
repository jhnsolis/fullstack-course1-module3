require 'httparty'

class Recipe
    include HTTParty

    @key = "f03cc67b6c4e6b304ae12614475fa5b5"
    ENV["FOOD2FORK_KEY"] = @key

    default_options.update(verify: false) #turn off SLL verification
    default_params.update(key: @key)    

    base_uri "http://food2fork.com/api"
    #https://www.food2fork.com/api/search?key=YOUR_API_KEY&q=chicken%20breast
    format :json

    def self.for(keyword)
        @options = {query: {q: keyword}}
        get("/search", @options)["recipes"]
    end

end
