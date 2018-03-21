class Category < ApplicationRecord
  has_many :jobs

  def job_attributes=(job_attributes)
    job_attributes.values.each do |job|
      job = Job.find_or_create_by(job)
      self.jobs << job
    end
  end

end
