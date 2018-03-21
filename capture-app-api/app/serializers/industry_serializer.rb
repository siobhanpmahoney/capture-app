class IndustrySerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :companies
end
