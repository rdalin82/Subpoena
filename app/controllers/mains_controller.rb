class MainsController < ApplicationController
  before_action :authenticate_user!
  
  def index
  end 

  def new
    @dropbox = current_user.dropbox_session if current_user.dropbox_session
    @providers = Provider.all
    @attorneys = Attorney.all
  end 

  def create 
    provider = Provider.find(params['providers'].to_i)
    dbsession = DropboxSession.deserialize(current_user.dropbox_session)
    client = DropboxClient.new(dbsession)
    response = client.put_file("#{provider.name} - #{params['employee']} " + ".rtf", SubpoenaParser.new(params).parse)    
    redirect_to root_path
  end 
end
