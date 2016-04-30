require "dropbox_sdk"

class DashboardsController < ApplicationController
	def authorize
		dbsession = DropboxSession.new(DROPBOX_APP_KEY, DROPBOX_APP_KEY_SECRET)
		#serialize and save this DropboxSession
		session[:dropbox_session] = dbsession.serialize
		#pass to get_authorize_url a callback url that will return the user here
		redirect_to dbsession.get_authorize_url url_for(:action => 'dropbox_callback')
	end
 
# @Params : None
# @Return : None
# @Purpose : To callback for dropbox authorization
	def dropbox_callback
		dbsession = DropboxSession.deserialize(session[:dropbox_session])
		dbsession.get_access_token #we've been authorized, so now request an access_token
		session[:dropbox_session] = dbsession.serialize
		current_user.update_attributes(:dropbox_session => session[:dropbox_session])
		session.delete :dropbox_session
		flash[:success] = "You have successfully authorized with dropbox."
		redirect_to new_path
	end # end of dropbox_callback action

	def unauthorize
		session[:dropbox_session] = nil
		current_user.dropbox_session = nil
		current_user.save!
		redirect_to root_path
	end

	def home
		if current_user.dashboard
	 		@dashboard = current_user.dashboard
	 		@dropbox = current_user.dropbox_session if current_user.dropbox_session
		end
		 #First, find the dashboard, then find the current user's dropbox_session from the database
	  if current_user.dropbox_session
	 		dbsession = DropboxSession.deserialize(current_user.dropbox_session)
 			# create the dropbox client object
 			@client = DropboxClient.new(dbsession, DROPBOX_APP_MODE).metadata('/')
	 end

 	 render layout: "dashboard"
	 else
 	 		redirect_to new_dashboard_url
 	 end
end
