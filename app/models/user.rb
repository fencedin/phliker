class User < ActiveRecord::Base
  has_many :tags
  has_many :photos, through: :tags
  has_secure_password
  validates :name, presence: true,
                   uniqueness: true

end
