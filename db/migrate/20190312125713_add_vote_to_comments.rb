class AddVoteToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :like, :integer, default: 0
    add_column :comments, :dislike, :integer, default: 0
    add_column :comments, :vote, :integer, default: 0
  end
end
