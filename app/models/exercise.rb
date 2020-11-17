class Exercise < ApplicationRecord
  belongs_to :activity
	 validates :name, presence: true
	 validates :content, presence: true
end
