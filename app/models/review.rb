class Review < ApplicationRecord
    belongs_to :admin, optional: true
    has_one_attached :image
    belongs_to :customer, optional: true
    belongs_to :genre
    has_many :comments, dependent: :destroy
    has_many :customers

    def get_image
        true
    end
end
