class Comment < ApplicationRecord

  belongs_to :customer
  belongs_to :review
  validates :comment, presence: true
end
