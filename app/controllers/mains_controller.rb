DROPBOX_APP_KEY = "uf1rqukssytvnd4" #replace with your own app key
DROPBOX_APP_KEY_SECRET = "5hjnoquh1xvdu05" #replace with your own key secret
DROPBOX_APP_MODE = "dropbox"
class MainsController < ApplicationController
	before_action :authenticate_user!
	def index

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
		dbsession = DropboxSession.deserialize(current_user.dropbox_session)
		client = DropboxClient.new(dbsession)
		response = client.put_file("#{params_hash['<employee>']}" + @provider.name + ".rtf", s)
		
		redirect_to root_path
	end 

end
