class Team < ActiveRecord::Base
	has_many :users
	belongs_to :form
end
