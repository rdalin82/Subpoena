class AttorneysController < ApplicationController
	def index
		@attorneys = Attorney.all 
	end 
	def show
		@attorney = Attorney.find(params[:id])
	end 
	def new
		@attorney = Attorney.new 
		@attorney.address = "100 W. Randolph Street, 13th Floor, Chicago, IL 60601"
	end 

end
