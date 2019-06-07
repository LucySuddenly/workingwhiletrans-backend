class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :website
      t.string :image_url
      t.string :description

      t.timestamps
    end
  end
end
