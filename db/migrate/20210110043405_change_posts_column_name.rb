class ChangePostsColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :posts, :user_id, :user
  end
end
