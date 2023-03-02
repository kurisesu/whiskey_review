class Tag < ApplicationRecord
  has_many :review_tags,dependent: :destroy, foreign_key: 'tag_id'
  # タグは複数の投稿を持つ　それは、reviews_tagsを通じて参照できる
  has_many :reviews,through: :review_tags

  validates :name, uniqueness: true, presence: true
end

