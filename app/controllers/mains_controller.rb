class MainsController < ApplicationController
	def index
		@providers = Provider.all
		@attorneys = Attorney.all 
	end 
end
