class DashboardController < ApplicationController
	before_filter :authenticate_user!
	before_filter :set_user 
	def index
		@user = current_user
	end




private
	def set_user
		@user = current_user
	end
end
