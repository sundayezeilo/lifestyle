class Article < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_and_belongs_to_many :categories
  has_one_attached :image
  default_scope -> { order(created_at: :desc) }
  validates :author_id, presence: true
  validates :categories, presence: true
  validates :title, presence: true, length: { maximum: 50 }
  validates :text, presence: true, length: { maximum: 300 }
  
  validates :image, content_type: { in: %w[image/jpeg image/gif image/png], message: "must be a valid image format" },
  size: { less_than: 5.megabytes,  message: "should be less than 5MB" }

  # Returns a resized image for display.
  def display_image
    image.variant(resize_to_limit: [500, 500])
  end
end
