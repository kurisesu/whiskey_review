class Review < ApplicationRecord
    belongs_to :admin, optional: true
    has_one_attached :image
    belongs_to :customer, optional: true
    belongs_to :genre
    has_many :comments, dependent: :destroy
    has_many :customers
    has_many :review_tags,dependent: :destroy
    has_many :tags,through: :review_tags

    def get_image
        true
    end
    
    def self.items_serach(search)
     Review.where(['title LIKE ? OR content LIKE ?', "%#{search}%", "%#{search}%"])
    end

    def save_tag(sent_tags)
    current_tags = self.tags.pluck(:name) unless self.tags.nil?
    old_tags = current_tags - sent_tags
    new_tags = sent_tags - current_tags

    old_tags.each do |old|
      self.tags.delete Tag.find_by(name: old)
    end

    new_tags.each do |new|
      new_review_tag = Tag.find_or_create_by(name: new)
      self.tags << new_review_tag
    end

    end


end
