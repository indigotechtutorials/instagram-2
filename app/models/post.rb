class Post < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_rich_text :body
  has_one_attached :image

  validates_presence_of :image, :body
end
