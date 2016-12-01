class AddCategoryIdToAnimes < ActiveRecord::Migration[5.0]
  def change
    add_column :animes, :category_id, :integer
  end
end
