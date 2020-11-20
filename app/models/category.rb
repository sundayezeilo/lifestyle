class Category < ApplicationRecord
  has_and_belongs_to_many :articles
  validates :priority, presence: true
  validates :name, presence: true, length: { maximum: 20 }
  default_scope -> { order('priority') }
  scope :fetch, -> { preload(articles: [{ image_attachment: :blob }]) }
end
