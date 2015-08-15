class ProvidersController < ApplicationController
	def index
		@providers = Provider.all
	end 
	def new
		@provider = Provider.new 
	end 
end
