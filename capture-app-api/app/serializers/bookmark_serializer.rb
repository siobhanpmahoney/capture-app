class BookmarkSerializer < ActiveModel::Serializer
  attributes :id, :title, :source_name, :summary, :url, :user_id, :company_id, :job_id
  belongs_to :user
  belongs_to :company
  belongs_to :job
end
