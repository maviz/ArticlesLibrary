class AddLikesToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :likes, :integer, :default => 0
  end
end
