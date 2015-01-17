class ApiController < ApplicationController
	before_filter :api_preparation


	def api_preparation
	@user = current_user
	unless @user
		head :unauthorized
		return false
	end
	end
end

