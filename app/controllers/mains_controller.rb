class MainsController < ApplicationController
	def index
		@files = Dir.entries('public/files')
		@files.delete('.')
		@files.delete('..')
	end 

	def new
		@providers = Provider.all
		@attorneys = Attorney.all
	end 

	def create 
		
		@provider = Provider.find(params['providers'].to_i)
		@attorney = Attorney.find(params['attorneys'].to_i)
		f = File.new("#{Rails.root}/public/files/"+Time.now.to_s+@provider.name+ ".txt", "w")
		f.write("#{@provider.name} \n" + "#{@provider.firstlineaddress} \n" + "#{@provider.citystatezip}")
		f.write("\n")
		f.write("#{@attorney.name}, #{@attorney.address}, phone: #{@attorney.phone}" )
		f.close 
		redirect_to root_path
	end 

	def download
		send_file "#{Rails.root}/public/files/"+params[:id], :type => 'text/plain'
	end

	private 
	def attorney_params
		params.require(:attorney).permit(:name, :address, :fax, :phone)
	end 

	def provider_params
		params.require(:provider).permit(:name, :doctor, :firstlineaddress, :secondlineaddress, :citystatezip)
	end

	def main_params 
		params.require('provider', 'attorney').permit('2', '1')
	end 
end
