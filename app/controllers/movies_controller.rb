class MoviesController < ApplicationController
	def index
		@movies = Movie.list({actor_id: params[:actor_id]})
	end
end
