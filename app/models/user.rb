class User < ActiveRecord::Base

  has_many :relationships
  has_many :incidents

end