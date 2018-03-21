class JobSerializer < ActiveModel::Serializer
  attributes :id, :title, :date_published, :contents, :museId, :location, :level, :date_saved, :overall_active_status, :applied_status, :date_applied, :application_response_status, :interview_invite, :interview_1_date, :interview_1_type, :interview_1_technical, :interview_1_response, :interview_2_date, :interview_2_type, :interview_2_technical, :interview_2_response, :interview_3_date, :interview_3_type, :interview_3_technical, :interview_3_response, :offer_status, :company_name, :company_industry, :category_name, :company_museId, :category_id, :company_id

  has_one :company
  has_many :users
  has_many :notes
  has_many :bookmarks

  belongs_to :category
end
