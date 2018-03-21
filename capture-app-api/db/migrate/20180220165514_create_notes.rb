class CreateNotes < ActiveRecord::Migration[5.1]
  def change
    create_table :notes do |t|
      t.string :title
      t.text :content
  
      t.belongs_to :user
      t.belongs_to :company
      t.belongs_to :job

      t.timestamps
    end
  end
end
