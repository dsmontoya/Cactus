class DashboardController < ApplicationController
	before_filter :authenticate_user!
	before_filter :set_user
	def index
	end

	def profile
	end

	def form
		@form = Form.new
		@q = User.ransack(params[:q])
		@users = @q.result(distinct: true)
	end

	def available_forms
	end

	def events
	end

	private
	def set_user
		@user = current_user
	end
end