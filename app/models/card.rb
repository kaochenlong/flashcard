class Card < ApplicationRecord

  has_one_attached :photo

  validates :title, presence: true
  validates :content, presence: true

  has_many :comments
  belongs_to :user

  has_many :favorite_cards
  has_many :users, through: :favorite_cards

  def favorited_by?(user)
    users.include?(user)
  end
end
