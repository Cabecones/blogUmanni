class RemovePostsFromPost < ActiveRecord::Migration[6.1]
  def change
    remove_column :posts, :posts, :text
  end
end
