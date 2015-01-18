class Form < ActiveRecord::Base
	belongs_to :user
	has_one :team
	accepts_nested_attributes_for :team

	# Validations
=begin
	validates :project, presence: true, length: { maximum: 500 }
	validates :first_hackathon, presence: true, length: {maximum: 500 }
	validates :why, presence: true
	validates :user_id, presence: true
	validates :code_of_conduct_read, presence: true
=end
end
