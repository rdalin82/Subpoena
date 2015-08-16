class ProvidersController < ApplicationController
	def index
		@providers = Provider.all
	end 
	def new
		@provider = Provider.new 
	end 
	def create 
		@provider = Provider.new(provider_params)
		respond_to do |format|
			if @provider.save!
				format.html { redirect_to providers_path, notice: "provider was successfully created." }
				format.json { render :show, status: created, location: @provider}
			else
				format.html{ render :new }
				format.json { render json: @provider.errors, status: :unprocessable_entity }
			end 
		end
	end 

	def show
		@provider = Provider.find(params[:id])
	end 

	def edit 
		@provider = Provider.find(params[:id])
	end 

	def update 
		@provider = Provider.find(params[:id])
		@provider.update!(provider_params)
		redirect_to providers_path
	end 

	def destroy
		@provider = Provider.find(params[:id])
		@provider.destroy!
		redirect_to providers_path
	end 


	private
	def provider_params
		params.require(:provider).permit(:name, :doctor, :firstlineaddress, :secondlineaddress, :citystatezip)
	end 
end
