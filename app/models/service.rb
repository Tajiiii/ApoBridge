class Service < ApplicationRecord
	attachment :image
	belongs_to :user
	belongs_to :category
	has_many :likes

	def liked_by?(user)
		likes.where(user_id: user.id).exists?
	end

	def self.search(search)
		if search
			Service.where(['name LIKE ?', "%#{search}%"])
		else
			Service.all
		end
	end

	def user
		return User.find_by(id: self.user_id)
	end
end
