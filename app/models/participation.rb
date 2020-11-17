class Participation < ApplicationRecord
  belongs_to :user
  belongs_to :activity
    validates_presence_of :user
	 validates :value, presence: true
	 validates :value, numericality: { only_integer: true }
	 validates :user_id,  presence: true
	validates_presence_of :activity
	 validates :activity_id,  presence: true
end
