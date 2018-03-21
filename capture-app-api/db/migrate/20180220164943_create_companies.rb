class CreateCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :size
      t.string :location
      t.text :description
      t.integer :museId
      t.string :twitter
      t.string :image_link
      t.string :image_link2
      t.string :image_mini
      t.string :company_logo
      t.string :industry_name
      t.belongs_to :industry

      t.timestamps
    end
  end
end
