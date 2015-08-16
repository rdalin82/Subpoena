class MainsController < ApplicationController
	def index
		@providers = Provider.all
		@attorneys = Attorney.all 
	end 

	private 
	def attorney_params
		params.require(:attorney).permit(:name, :address, :fax, :phone)
	end 

	def provider_params
		params.require(:provider).permit(:name, :doctor, :firstlineaddress, :secondlineaddress, :citystatezip)
	end
end
