class MainsController < ApplicationController
	before_action :authenticate_user!
	def index
		@files = Dir.entries('./public/files')
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
		s = File.read("#{Rails.root}/public/template/subpoena.rtf")
		params_hash = {
			'<attyname>' => @attorney.name, 
			'<attyaddress>'=>@attorney.address,
			'<attyphone>' => @attorney.phone, 
			'<providername>' => @provider.name, 
			'<provideraddress>' => @provider.firstlineaddress,
			'<providercitystatezip>' => @provider.citystatezip, 
			'<docket>' => params['docket'], 
			'<employee>' => params['employee'],
			'<employer>' => params['employer'], 
			'<n1>' => params['n1'], 
			'<n2>' => params['n2'],
			'<returndate>' => params['returndate']
		}

		params_hash.each {|k,v| s = s.gsub(k, v) }
		
		File.write("#{Rails.root}/public/files/"+Time.now.to_s+@provider.name+ ".rtf", s)
		
		redirect_to root_path
	end 

	def download
		send_file File.join(Rails.root,"/public/files/", params[:id]), filename: "#{params[:id]}", type:'application/msword'
	end
end
