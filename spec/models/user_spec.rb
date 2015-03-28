require 'rails_helper'

describe User do

	include TestFactories

	describe "#favorited(post)" do

		before do
			@post = associated_post
			@user = authenticated_user
		end
		
		it "returns `nil` if the user has not favorited the post" do			
			expect(@post.favorites.where(user: @user).first).to be_nil
		end

		it "returns the appropriate favorite if it exists" do
			f = @post.favorites.create(user: @user)
			expect(@post.favorites.where(user: @user).first).to eq(f)
		end

		it "returns `nil` if the user has favorited another post" do
			p = @user.posts.create(user: @user)
			p.favorites.create(user: @user)
			expect(@post.favorites.where(user: @user)).to be_nil
			p.save
		end

end
	
end