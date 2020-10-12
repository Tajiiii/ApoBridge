class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :services, dependent: :destroy
  attachment :image
  has_many :likes
  has_many :liked_services, through: :likes, source: :service

  has_many :following_relationships, foreign_key: "follower_id", class_name: "Relationship", dependent: :destroy
  has_many :followings, through: :following_relationships
  has_many :follower_relationships, foreign_key: 'following_id', class_name: "Relationship", dependent: :destroy
  has_many :followers, through: :follower_relationships

#フォローしようとしている other_user が自分自身ではないかを検証
#既にフォローされている場合にフォローが重複して保存されることがなくなる
  def follow!(other_user)
  		following_relationships.create!(following_id: other_user.id)
  end
#フォローがあればアンフォローする
#relationship が存在すれば destroyする
  def unfollow!(other_user)
    following_relationships.find_by(following_id: other_user.id).destroy
  end

#フォローしている User 達を取得し、include?(other_user) によって other_user が含まれていないかを確認
  def following?(other_user)
  	following_relationships.find_by(following_id: other_user.id)
  end
end
