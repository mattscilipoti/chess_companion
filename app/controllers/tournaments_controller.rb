class TournamentsController < ApplicationController
	before_filter :require_signin

	def index
		@user = current_user
		#mms: good security/auth.  Only allow this user to their stuff.
		@tournaments = current_user.tournaments.all
	end

	def show
		@tournament = current_user.tournaments.find(params[:id])
	end

	def new
		@tournament = current_user.tournaments.new
	end

	def create
		@user = current_user
		@tournament = current_user.tournaments.new(tournament_params)
		@tournament.save!

		respond_to do |format|
			# mms: redirect should use *_url named route helpers: `user_tournaments_url(current_user)`
		  format.html {redirect_to user_tournaments_path(current_user)}
		  format.json {render json: @tournament}
		  format.js
		end

	end

	def edit
		@tournament = current_user.tournaments.find(params[:id])
	end

	def update
		@tournament = current_user.tournaments.find(params[:id])
	end

	def destroy
		@user = current_user
		@tournament = current_user.tournaments.find(params[:id])
		@tournament.destroy
		respond_to do |format|
		  format.html {redirect_to user_tournaments_path}
		  format.js
		end
	end

	private

	def tournament_params
		params.require(:tournament).permit(:event, :location, :date)
	end

end
