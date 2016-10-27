class CreateAnimes < ActiveRecord::Migration[5.0]
  def change
    create_table :animes do |t|
      t.string :title
      t.text :description
      t.string :creator

      t.timestamps
    end
  end
end
