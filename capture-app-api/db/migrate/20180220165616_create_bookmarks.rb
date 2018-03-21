class CreateBookmarks < ActiveRecord::Migration[5.1]
  def change
    create_table :bookmarks do |t|
      t.string :title
      t.string :source_name
      t.text :summary
      t.string :url

      t.belongs_to :user
      t.belongs_to :company
      t.belongs_to :job

      t.timestamps
    end
  end
end
