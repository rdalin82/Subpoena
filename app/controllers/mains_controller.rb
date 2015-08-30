class MainsController < ApplicationController
	before_action :authenticate_user!
	def index
		#if !Rails.env.production? 
			@files = Dir.entries("public/template")
			@files.delete('.')
			@files.delete('..')
		#else 
		#	@files = Dir.entries("./app/public/files")
		#end 
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
			'<returndate>' => params['returndate'], 
			'<todaysdate>' => params['todaysdate']
			}

		params_hash.each {|k,v| s = s.gsub(k, v) }
		file_path = "#{Rails.root}/public/template/"+ @provider.name+ ".rtf"
		file = File.write(file_path, s)

		redirect_to root_path
	end 

	def download
		if Rails.env.production? 
			file = "./app/public/template/" + params[:id]
		else 
			file = "#{Rails.root}" + "/public/template/" + params[:id]
    end 
		send_file(file, 
			filename: file, 
			type:'application/msword',
			stream: true, 
			buffer_size: 4096

			)

	end
end
