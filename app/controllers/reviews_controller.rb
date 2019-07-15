class ReviewsController < ApplicationController

    def create 
        review = Review.new(review_params)
        if review.valid?
            review.save
            render json: review
        else
            render json: {"message": "the review was not successfully saved"}
        end
    end

    def show
        review = Review.find(params[:id])
        render json: review
    end

    private 

    def review_params
        params.require(:review).permit(:title, :job_title, :body, :rating, :company_id)
    end
end
