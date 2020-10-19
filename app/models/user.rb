class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :services, dependent: :destroy
  attachment :image
  has_many :likes
  has_many :liked_services, through: :likes, source: :service

  validates :name, :email, :phonenumber, :postcode, :address, presence: true
  validates :phonenumber, numericality: {only_integer: true}
  validates :postcode, length: {is: 7}, numericality: {only_integer: true}

  def liked_by?(service_id)
    likes.where(service_id: service_id).exists?
  end
  has_many :comments, dependent: :destroy

  has_many :following_relationships, foreign_key: "follower_id", class_name: "Relationship", dependent: :destroy
  has_many :followings, through: :following_relationships
  has_many :follower_relationships, foreign_key: 'following_id', class_name: "Relationship", dependent: :destroy
  has_many :followers, through: :follower_relationships

  def follow!(other_user)
  		following_relationships.create!(following_id: other_user.id)
  end

  def unfollow!(other_user)
    following_relationships.find_by(following_id: other_user.id).destroy
  end

  def following?(other_user)
  	following_relationships.find_by(following_id: other_user.id)
  end

  has_many :active_notifications, class_name: "Notification", foreign_key: "visiter_id", dependent: :destroy
  has_many :passive_notifications, class_name: "Notification", foreign_key: "visited_id", dependent: :destroy

  def create_notification_follow!(current_user)
    temp = Notification.where(["visiter_id = ? and visited_id = ? and action = ?", current_user.id, id, 'follow'])
    if temp.blank?
      notification = current_user.active_notifications.new(
        visited_id: id,
        action: 'follow'
        )
      notification.save if notification.valid?
    end
  end
end
