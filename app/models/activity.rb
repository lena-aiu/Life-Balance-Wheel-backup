class Activity < ApplicationRecord
	has_many :exercises
	has_many :participations
	 validates :name, presence: true
	 validates :score,  presence: true
end
