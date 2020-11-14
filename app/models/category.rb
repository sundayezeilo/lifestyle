class Category < ApplicationRecord
  has_and_belongs_to_many :articles
  default_scope -> { order('priority') }
  validates :priority, presence: true
  validates :name, presence: true, length: { maximum: 15 }

  def name_capitalize
    name.capitalize
  end
end