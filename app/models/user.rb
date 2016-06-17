class User < ActiveRecord::Base

  has_many :relationships
  has_many :incidents

  validates :nickname, presence: true
  validates :email, presence: true

end