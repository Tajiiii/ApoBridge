class Comment < ApplicationRecord

	belongs_to :service
	belongs_to :user
	validates :content, presence: true, length: {maximum: 200}
  has_many :notifications, dependent: :destroy
end
