class Movie < ApplicationRecord
	has_many :movie_casts
	has_many :reviews
	has_many :actor, through: :movie_casts
	has_many :shoot_locations, through: :movie_casts
	belongs_to :director

	def self.list(options = {})
		conditions = []
		conditions << "actors_movie_casts.id = '#{options[:actor_id]}'" if options[:actor_id].present?
		Movie.joins(:director
			).joins(:movie_casts => :actor
			).group("movie_id"
			).select("movies.id, movies.name, movies.description, movies.year, 
								movies.avg_rating, users.name as director_name, 
								group_concat(actors_movie_casts.name) as actors_name"
			).where(conditions.join(" AND ")).order("avg_rating desc")
	end
end
