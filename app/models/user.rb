class User < ApplicationRecord
	has_many :sectors
	has_many :participations
	has_many :activities, through: :participations
	 validates :first_name, presence: true
	 validates :last_name, presence: true
	 validates :phone,  presence: true
	 validates :phone, numericality: { only_integer: true }
	 validates :phone, length: { is: 10}
	 validates :email, presence: true
	 validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

	 def full_name
	   "#{first_name} #{last_name}"
	 end
	 
	 #scope by_name  user(:full_name)
end
