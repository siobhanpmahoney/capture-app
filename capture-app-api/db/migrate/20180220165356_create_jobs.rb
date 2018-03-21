class CreateJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :date_published
      t.text :contents
      t.integer :museId
      t.string :location
      t.string :level
      t.datetime :date_saved
      t.boolean :overall_active_status
      t.boolean :applied_status
      t.string :date_applied
      t.string :application_response_status
      t.boolean :interview_invite
      t.string :interview_1_date
      t.string :interview_1_type
      t.boolean :interview_1_technical
      t.string :interview_1_response
      t.string :interview_2_date
      t.string :interview_2_type
      t.boolean :interview_2_technical
      t.string :interview_2_response
      t.string :interview_3_date
      t.string :interview_3_type
      t.boolean :interview_3_technical
      t.string :interview_3_response
      t.boolean :offer_status
      t.string :company_name
      t.string :company_industry
      t.string :category_name
      t.integer :company_museId
      t.belongs_to :company
      t.belongs_to :category

      t.timestamps
    end
  end
end
