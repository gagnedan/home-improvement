class Project < ApplicationRecord
	enum status: [:created, :started, :stopped, :completed]
  belongs_to :user
  has_many :comments, :dependent => :destroy
end
