class CompaniesController < ApplicationController

    def search
        company = Company.find_by(name: params["searchForm"][0].downcase)
        if company == nil 
            company = {none: "none"}
        end
        render json: company
    end
end
