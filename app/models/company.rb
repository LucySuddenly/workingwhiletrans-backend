class Company < ApplicationRecord
    has_many :reviews
    validates :name, uniqueness: true
    validates :name, presence: true 
    validates :description, presence: true
    validates :image_url, presence: true 
    validates :website, presence: true
end
