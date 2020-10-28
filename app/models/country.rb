class Country < ApplicationRecord
	validates_uniqueness_of :name, :case_sensitive => false
	has_many :locations
end
