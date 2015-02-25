class PostPolicy < ApplicationPolicy
	class Scope
		attr_reader :user, :scope

		def initialize(user,scope)
			@user = user
			@scope = scope
		end

		def resolve
			if user.admin?
				scope.all
			elsif user.moderator?
				scope.all
			else
				scope.where(:user => true)
			end
		end
	
	end

end

