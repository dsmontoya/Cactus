class UniversityController < ApplicationController
	def university_params
	university_params = params.require(:university).permit(:name, :domain, :country_code)
	end
end
