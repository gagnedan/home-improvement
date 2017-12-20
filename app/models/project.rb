class Project < ApplicationRecord
  enum status: [:created, :started, :stopped, :completed]
  belongs_to :user
  has_many :comments, :dependent => :destroy

  validates :name, :description, :is_public, :estimated_effort, :actual_effort, :status, presence: true
	validates_numericality_of :estimated_effort, :actual_effort, only_integer: true
end
