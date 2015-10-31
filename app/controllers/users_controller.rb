class UsersController < ApplicationController


	def index
	  if params[:search].present?
	    @users = User.near(params[:search], 50, :order => :distance)
	  else
	    @users = User.all
	  end
	end

	def show
		@user = User.find(params[:id])
	end

	def new
		@user = current_user
	end
	
end
