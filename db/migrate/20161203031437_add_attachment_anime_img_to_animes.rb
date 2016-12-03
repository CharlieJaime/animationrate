class AddAttachmentAnimeImgToAnimes < ActiveRecord::Migration
  def self.up
    change_table :animes do |t|
      t.attachment :anime_img
    end
  end

  def self.down
    remove_attachment :animes, :anime_img
  end
end
