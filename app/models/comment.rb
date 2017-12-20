class Comment < ApplicationRecord
  belongs_to :project, optional: true
  belongs_to :user

  validates :body, presence: true
end
