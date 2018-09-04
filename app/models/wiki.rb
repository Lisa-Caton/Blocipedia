class Wiki < ApplicationRecord
  has_many :collaborators
  has_many :users, through: :collaborators
  belongs_to :user

  validates :user, presence: true
  validates :title, length: {minimum: 5}, presence: true
  validates :body, length: {minimum: 10}, presence: true

  default_scope { order('created_at DESC') }
end
