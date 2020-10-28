class MovieCast < ApplicationRecord
	belongs_to :actor
	belongs_to :movie
	has_many :shoot_locations
end
