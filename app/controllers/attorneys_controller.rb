class AttorneysController < ApplicationController
	def index
		@attorneys = Attorney.all 
	end 
end
