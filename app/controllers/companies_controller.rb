class CompaniesController < ApplicationController

    def search
        fm = FuzzyMatch.new(Company.all, :read => :name)
        result = fm.find(params["searchForm"][0].downcase)
        if result == nil 
            result = {none: "none"}
        end
        render json: result
    end
end
