class AddAnimeIdToReviews < ActiveRecord::Migration[5.0]
  def change
    add_column :reviews, :anime_id, :integer
  end
end
