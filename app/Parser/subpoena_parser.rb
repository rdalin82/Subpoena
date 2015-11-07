

class SubpoenaParser 
		def initialize(params, args={})
			@params = params
			@provider = args[:provider] || Provider.find(params['providers'].to_i)
			@attorney = args[:attorney] || Attorney.find(params['attorneys'].to_i)
			@params_hash = {}
		end 

		def parse
			s = File.read("#{Rails.root}/public/template/subpoena.rtf")
			params_hash.each {|k,v| s = s.gsub(k, v) }
			return s
		end
		
		private

		def params_hash 
			
			params_hash = {
			'<attyname>' => @attorney.name, 
			'<attyaddress>'=>@attorney.address,
			'<attyphone>' => @attorney.phone, 
			'<providername>' => @provider.name, 
			'<provideraddress>' => @provider.firstlineaddress,
			'<providercitystatezip>' => @provider.citystatezip, 
			'<docket>' => @params['docket'], 
			'<employee>' => @params['employee'],
			'<employer>' => @params['employer'], 
			'<n1>' => @params['n1'], 
			'<n2>' => @params['n2'],
			'<returndate>' => @params['returndate'], 
			'<todaysdate>' => @params['todaysdate']
			}  if @params_hash.empty? 
		end
	end 