class AddVoteToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :like, :integer, default: 0
    add_column :posts, :dislike, :integer, default: 0
    add_column :posts, :vote, :integer, default: 0
  end
end
