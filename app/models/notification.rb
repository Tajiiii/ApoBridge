class Notification < ApplicationRecord
	#スコープ（新着順）
	default_scope -> {order(created_at: :desc)}

	#optional: trueはservice_idにnilを許容するもの
	belongs_to :service, optional: true
  belongs_to :comment, optional: :true
	belongs_to :visiter, class_name: 'User', foreign_key: 'visiter_id', optional: true
	belongs_to :visited, class_name: 'User', foreign_key: 'visited_id', optional: true
end
