class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :title
      t.string :job_title
      t.text :body
      t.integer :rating
      t.integer :company_id

      t.timestamps
    end
  end
end
