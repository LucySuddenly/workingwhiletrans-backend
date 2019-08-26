class Review < ApplicationRecord
    belongs_to :company
    validates :title, presence: true
    validates :job_title, presence: true
    validates :body, presence: true 
    validates :rating, presence: true
end
