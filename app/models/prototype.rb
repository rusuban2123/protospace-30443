class Prototype < ApplicationRecord
  validates :image, :catch_copy, :title, :conept, presence: true

  
  belongs_to :user
  has_one_attached :image
  has_many :comments, dependent: :destroy
end
