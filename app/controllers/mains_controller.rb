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
		f = File.read("#{Rails.root}/public/template/subpoena.rtf")
		s = f
		s = s.gsub('<attyname>', @attorney.name)
		s = s.gsub('<attyaddress>', @attorney.address)
		s = s.gsub('<attyphone>', @attorney.phone)
		s = s.gsub('<providername', @provider.name)
		s = s.gsub('<provideraddress>', @provider.firstlineaddress)
		s = s.gsub('<providercitystatezip>', @provider.citystatezip)
		s = s.gsub('<docket>', params['docket'])
		s = s.gsub('<employee>', params['employee'])
		s = s.gsub('<employer>', params['employer'])
		s = s.gsub('<n1>', params['n1'])
		s = s.gsub('<n2>', params['n2'])
		s = s.gsub('<returndate>', params['returndate'])
		File.write("#{Rails.root}/public/files/"+Time.now.to_s+@provider.name+ ".rtf", s)
		
		redirect_to root_path
	end 

	def download
		send_file "#{Rails.root}/public/files/"+params[:id], :type => 'application/msword'
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
