class Job < ApplicationRecord
  belongs_to :company
  belongs_to :category, optional: true
  has_many :user_jobs
  has_many :users, through: :user_jobs
  has_many :notes
  has_many :bookmarks





  def save_company
    company = self.company
    Company.find_or_create_by(company[:museId])
    company.jobs << self
  end

  def company_attributes=(company_attributes)
    company_attributes.values.each do |c|
      co = Company.find_or_create_by(c)
      self.company = co
    end
  end

  def job_category
    category = Category.find(self.category_id)
    return category.name
  end

  def note_attributes=(note_attributes)
    note_attributes.values.each do |n|
      note = Note.find_or_create_by |n|
      self.notes << note
    end
  end

  def bookmark_attributes=(bookmark_attributes)
    bookmark_attributes.values.each do |n|
      bookmark = Bookmark.find_or_create_by(n)
      self.bookmarks << bookmark
    end
  end

  def rel_bookmarks(userId)
    company=Company.find(self.company_id)
    user = User.find(userId)
    user.bookmarks.select do |bk|
      bk.company_id == self.company.id
    end
  end




end
