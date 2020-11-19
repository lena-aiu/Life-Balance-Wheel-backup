class Sector < ApplicationRecord
  belongs_to :user
  validates_presence_of :user
  	 validates :name, presence: true
	 validates :trainer, presence: true
	 validates :value, presence: true
	 validates :value, numericality: { only_integer: true }
	 validates :user_id,  presence: true
end
