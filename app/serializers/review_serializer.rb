class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :title, :job_title, :body, :rating, :company_id 
  belongs_to :company
end
