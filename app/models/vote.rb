class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :article
  validates :user_id, presence: true
  validates :article_id, presence: true
  validates_uniqueness_of :user_id, scope: :article_id
end
