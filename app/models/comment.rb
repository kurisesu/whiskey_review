class Comment < ApplicationRecord

  has_many :comments
  has_many :customers

end
