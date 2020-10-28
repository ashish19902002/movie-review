class ShootLocation < ApplicationRecord
	belongs_to :location
	belongs_to :movie_cast
end
