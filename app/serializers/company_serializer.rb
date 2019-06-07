class CompanySerializer < ActiveModel::Serializer
  attributes :id, :name, :website:, :image_url, :description
  has_many :reviews
end
