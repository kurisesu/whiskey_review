class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   validates :nickname, presence: true
   validates :email, presence: true

  def active_for_authentication?
    super && (is_deleted == false)
  end

  has_one_attached :image

  has_many :comments
  has_many :reviews, dependent: :destroy

end
