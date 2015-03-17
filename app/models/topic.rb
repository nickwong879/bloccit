class Topic < ActiveRecord::Base

	has_many :posts

	
	validates :name, length: { minimum: 5 }, presence: true

#def paginate(items={})

#	limit(items[:page]).offset(items[:per_page] * 10)

#end

end
