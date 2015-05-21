class UsersController < ApplicationController

	before_action :require_signin, except: [:new, :create]

	def index
		@users = User.all
	end

	def show
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			sign_in @user
			redirect_to root_path
		else
			render :new
		end
	end

	def edit
	end

	def update
	end

	def destroy
	end

	private

	def user_params
		params.require(:user).permit(
			:name,
			:email,
			:uscf_id,
			:password,
			:password_confirmation,
			:admin  #mms: means any hacker can set admin flag.  Recommend only setting admin from authenticated route.
		)
	end
end
