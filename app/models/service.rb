class Service < ApplicationRecord
	attachment :image
	belongs_to :user
	belongs_to :category

	def user
		return User.find_by(id: self.user_id)
	end
end
