class Article < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_and_belongs_to_many :categories
  has_one_attached :image, dependent: :destroy
  has_many :votes, dependent: :destroy
  validates :author_id, presence: true
  validates :categories, presence: true
  validates :title, presence: true, length: { maximum: 100 }
  validates :text, presence: true, length: { maximum: 1000 }

  validates :image, content_type: { in: %w[image/jpeg image/gif image/png], message: 'must be a valid image format' },
                    size: { less_than: 5.megabytes, message: 'should be less than 5MB' }

  default_scope -> { order(created_at: :desc) }
  scope :fetch_most_voted, -> { preload({ image_attachment: :blob }).order(votes_count: :desc).first }

  # Returns a resized image for display.
  def display_image
    image.variant(resize_to_limit: [500, 500])
  end
end
