class Project < ApplicationRecord
  enum status: [:created, :started, :stopped, :completed]
  belongs_to :user
  has_many :comments, :dependent => :destroy
  
  validates :name, :description, :estimated_effort, :actual_effort, :status, presence: true
	validates_inclusion_of :is_public, :in => [true, false]
	validates_inclusion_of :estimated_effort, :actual_effort, :in => 1..10
	validates_numericality_of :estimated_effort, :actual_effort, only_integer: true, :in => 1..10
end
