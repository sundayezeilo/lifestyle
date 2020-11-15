class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :article
  validates :user_id, presence: true, uniqueness: true
  validates :article_id, presence: true
end
