class UserSerializer < ActiveModel::Serializer
  attributes :id, :username
  # , :password_digest

  has_many :jobs
  has_many :bookmarks
  has_many :notes
end
