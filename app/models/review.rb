class Review < ApplicationRecord
    belongs_to :admin, optional: true
    has_one_attached :image

    belongs_to :genre
    has_many :comments
    has_many :costmers


    def get_image
        true
    end
end
