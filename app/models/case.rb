class Case < ActiveRecord::Base

	validates :continent , :country , :district , :case_category , :description , presence: true
	
end
