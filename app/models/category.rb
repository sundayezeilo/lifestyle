class Category < ApplicationRecord
  has_and_belongs_to_many :articles
  validates :priority, presence: true
  validates :name, presence: true, length: { maximum: 20 }

  scope :orderby_priority, -> { order('priority') }

  def name_capitalize
    name.capitalize
  end
end
