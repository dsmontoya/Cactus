class DashboardController < ApplicationController
	before_filter :authenticate_user!
	before_filter :set_user
	def index
	end

	def profile
		@user = current_user
	end

	def form
		@form = Form.new
		@q = User.ransack(params[:q])
		@users = @q.result(distinct: true)
	end

	def available_forms
	end

	def available_forms
	end

	private
	def set_user
		@user = current_user
	end
end