class Location < ApplicationRecord
	validates_uniqueness_of :name, :case_sensitive => false
	has_many :shoot_locations
	belongs_to :country
end
