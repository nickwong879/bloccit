require 'rails_helper'

describe User do

	describe "#favorited(post)" do

		before do
			@post = create(:post)
			@user = create(:user)
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

	describe ".top_rated" do

		before do
			@user1 = create(:user)
			post = create(:post, user: @user1)
			create(:comment, user: @user1, post: post)

			@user2 = create(:user)
			post = create(:post, user: @user2)
			2.times { create(:comment, user: @user2, post: post) }
		end

		it "returns users ordered by comments + posts" do
			expect( User.top_rated ).to eq([@user2, @user1])
		end

		it "stores a 'posts_count' on user" do
			users = User.top_rated
			expect( users.first.posts_count ).to eq(1)
		end

		it "stores a 'comments_count' on user" do
			users = User.top_rated
			expect( users.first.comments_count ).to eq(2)
		end
	end
	
end