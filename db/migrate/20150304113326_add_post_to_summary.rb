class AddPostToSummary < ActiveRecord::Migration
  def change
    add_reference :summaries, :post, index: true
    add_foreign_key :summaries, :posts
  end
end
