class Post < ActiveRecord::Base
	has_many :comments
	has_one :summary
	belongs_to :user
	belongs_to :topic

	default_scope { order('created_at DESC')}

	validates :title, length: { minimum: 5 }, presence: true
	validates :body, length: { minimum: 20 }, presence: true
	validates :user, presence: true


	#scope :ordered_by_title, -> { order('title DESC')}
	#scope :ordered_by_reverse_created_at, -> { order('created_at ASC')}

end
