class AddLikesToPosts < ActiveRecord::Migration[6.0]
  def change
    add_reference :posts, :like, null: true, foreign_key: true
  end
end
