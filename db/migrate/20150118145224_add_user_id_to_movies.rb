class AddUserIdToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :user_id, :integer
    add_column :movies, :image, :string
  end
end
