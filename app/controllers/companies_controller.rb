class CompaniesController < ApplicationController

    def search
        fm = FuzzyMatch.new(Company.all, :read => :name)
        result = fm.find(params["searchForm"][0].downcase)
        if result == nil 
            company = {none: "none"}
        end
        render json: company
    end
end
