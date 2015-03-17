module Paginate
	
	def paginate(items={})

	Self.limit(items[:per_page]).offset(items[:page] * 10)

	end

end
