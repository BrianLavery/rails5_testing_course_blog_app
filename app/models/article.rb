class Article < ApplicationRecord
  validates :title, :body, presence: true

  default_scope { order(created_at: :desc) } # Default order will be latest created

  belongs_to :user
end
