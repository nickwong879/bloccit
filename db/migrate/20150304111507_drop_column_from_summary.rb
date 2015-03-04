class DropColumnFromSummary < ActiveRecord::Migration
  def change
  	remove_column :summaries, :post_id, :integer
  end
end
