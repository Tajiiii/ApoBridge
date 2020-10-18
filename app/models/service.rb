class Service < ApplicationRecord
	attachment :image
	belongs_to :user
	belongs_to :category
	has_many :comments, dependent: :destroy
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

	has_many :notifications, dependent: :destroy

	def create_notification_by(current_user)
		notification = current_user.active_notifications.new(
			service_id: id,
			visited_id: user_id,
			action: "like"
			)
		notification.save if notification.valid?
	end
end
