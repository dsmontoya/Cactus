class DashboardController < ApplicationController
	before_filter :authenticate_user!
	before_filter :set_user
	def index
	end

	def profile
	end

	def form
	end

	private
	def set_user
		@user = current_user
	end
end