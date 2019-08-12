class CompaniesController < ApplicationController

    def search
        results = []
        collection = Company.all.to_a
        5.times do |i|
            fm = FuzzyMatch.new(collection, :read => :name)
            result = fm.find(params["searchForm"][0].downcase)
            if result != nil
                results[i] = result
                collection.slice!(collection.index(result))
            end
        end
        render json: results
    end

    def create
        company = Company.find_or_create_by(company_params)
        if company.valid?
            if company.image_url[0..3] != "http"
                company.image_url = "http://" + company.image_url
            end
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
        if length != 0 
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
