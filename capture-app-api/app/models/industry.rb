class Industry < ApplicationRecord
  has_many :companies

  def company_attributes=(company_attributes)
    company_attributes.values.each do |c|
      company = Company.find_or_create_by(c)
      self.companies << company
    end
  end

end
