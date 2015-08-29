class MainsController < ApplicationController
	before_action :authenticate_user!
	def index
		@files = Dir.entries('./app/public/files')
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
			'<returndate>' => params['returndate'], 
			'<todaysdate>' => params['todaysdate']
			}

		params_hash.each {|k,v| s = s.gsub(k, v) }
		
		File.write("#{Rails.root}/public/files/"+rand(0...100).to_s+@provider.name+ ".rtf", s)

		redirect_to root_path
	end 

	def download
		if Rails.env.production? 
			file = "./app/public/files/" + params[:id]
		else 
			file = "#{Rails.root}" + "/public/files/" + params[:id]
    end 
		send_file(file, 
			filename: file, 
			type:'application/msword',
			stream: true, 
			buffer_size: 4096

			)

	end
end
