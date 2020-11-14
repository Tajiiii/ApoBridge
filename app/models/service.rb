class Service < ApplicationRecord
	attachment :image
	belongs_to :user
	belongs_to :category
	has_many :comments, dependent: :destroy
	has_many :likes

	validates :name, :introduction, :price, :category_id, :area, presence: true
	validates :introduction, length: {maximum: 300}

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


	def create_notification_comment!(current_user, comment_id)
		notification = current_user.active_notifications.new(
			service_id: id,
			comment_id: comment_id,
			visited_id: user_id,
			action: "comment"
			)

		#自分に対するコメントの場合は通知済みとする
		if notification.visiter_id == notification.visited_id
			notification.checked = true
		end
		notification.save if notification.valid?
	end

	ransacker :likes_count do
		query = '(SELECT COUNT(likes.service_id) FROM likes where likes.service_id = services.id GROUP BY likes.service_id)'
		Arel.sql(query)
	end

end
