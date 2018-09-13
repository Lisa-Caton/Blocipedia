class Wiki < ApplicationRecord
  belongs_to :user
  has_many :collaborators
  has_many :users, through: :collaborators


  validates :user, presence: true
  validates :title, length: {minimum: 5}, presence: true
  validates :body, length: {minimum: 5}, presence: true

  default_scope { order('created_at DESC') }
end
