class Card < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true

  has_many :comments
  belongs_to :user

  has_many :favorite_cards
  has_many :users, through: :favorite_cards
end
