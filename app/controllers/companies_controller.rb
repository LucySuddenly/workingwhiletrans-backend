class CompaniesController < ApplicationController

    def search
        fm = FuzzyMatch.new(Company.all, :read => :name)
        result = fm.find(params["searchForm"][0].downcase)
        if result == nil 
            result = {none: "none"}
        end
        render json: result
    end

    def create
        company = Company.find_or_create_by(company_params)
        if company.valid?
            company.save
            render json: company
        else
            render json: {message: "the company did not successfully save"}
        end 
    end

    def show 
        sum = 0
        company = Company.find(params["id"])
        length = company.reviews.length
        company.reviews.each do |review|
            sum += review.rating
        end
        if sum.to_f / length.to_f != nil 
            average = sum.to_f / length.to_f
        else
            average = 0
        end
        company = company.to_json(:include => :reviews)
        company = JSON.parse(company)
        render json: {company: company, ratings_average: average }
    end

    private

    def company_params
        params.permit(:name, :website, :image_url, :description)
    end
end
