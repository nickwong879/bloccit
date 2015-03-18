class CommentPolicy < ApplicationPolicy

	def new?
		create?
	end

	def create?
	user.present? && (record.user == user || user.admin?)
	end
	
	def show?
	false
	end

end
