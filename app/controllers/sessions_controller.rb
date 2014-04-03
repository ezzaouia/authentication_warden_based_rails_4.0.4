class SessionsController < ApplicationController
	def new
		# debugger
		flash.now.alert = request.env['warden'].message if request.env['warden'].message.present?
	end

	def create
		request.env['warden'].authenticate!
	  redirect_to home_url, :notice => "Signed in captain.. :p"
	end

	def destroy
		request.env['warden'].logout
  	redirect_to root_url, :notice => "Signed out!"
	end
end