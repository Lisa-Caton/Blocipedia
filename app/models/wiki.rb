class Wiki < ApplicationRecord
  belongs_to :user, optional: true

  validates :title, length: {minimum: 5}, presence: true
  validates :body, length: {minimum: 10}, presence: true

  default_scope { order('created_at DESC') }
end
