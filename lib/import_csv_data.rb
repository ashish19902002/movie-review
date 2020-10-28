require 'csv'
module ImportCsvData
	extend self
	def import_movies(file)
		movies = []
		CSV.foreach(file, col_sep: ',', row_sep: :auto, headers: true) do |row|
			actor = Actor.where(name: row["Actor"]).first_or_create
			director = Director.where(name: row["Director"]).first_or_create
			country = Country.where(name: row["Country"]).first_or_create
			location = Location.where(name: row["Filming location"], country_id: country.id).first_or_create
			movie = Movie.where(name: row["Movie"]).first_or_create do |movie|
		  				movie.description = row["Description"]
		  				movie.year = row["Year"]
		  				movie.director_id = director.id
						end
			movie_cast = MovieCast.where(actor_id: actor.id, movie_id: movie.id).first_or_create
			shoot_location = ShootLocation.where(location_id: location.id, movie_cast_id: movie_cast.id).first_or_create
		end
	end

	def import_reviews(file)
		reviews = []
		CSV.foreach(file, col_sep: ',', row_sep: :auto, headers: true) do |row|
			movie = Movie.find_by(name: row["Movie"])
			user = Person.where(name: row["User"]).first_or_create
			if movie.present? && user.present?
				now = Time.now
				reviews << {movie_id: movie.id, user_id: user.id, rating: row["Stars"], content: row["Review"], created_at: now, updated_at: now}
			end
		end
		Review.upsert_all(reviews, unique_by:  %i[movie_id user_id])
		Movie.joins(:reviews).group("movie_id").select("movies.id, AVG(reviews.rating) as avg_rating").each{|movie|movie.update_column(:avg_rating, movie.avg_rating)}
	end
end