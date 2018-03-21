class Company < ApplicationRecord
  has_many :jobs
  has_many :bookmarks
  has_many :notes
  belongs_to :industry, optional: true


  def job_attributes=(job_attributes)
    job_attributes.values.each do |j|
      job = Job.find_or_create_by(j)
      self.jobs << job
    end
  end

  def bookmark_attributes=(bookmark_attributes)
    bookmark_attributes.values.each do |n|
      bookmark = Bookmark.find_or_create_by(n)
      self.bookmarks << bookmark
    end
  end

end
