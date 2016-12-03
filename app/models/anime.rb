class Anime < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :review

  has_attached_file :anime_img, styles: { :anime_index => "250x350", :anime_show => "325x475 "}, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :anime_img, content_type: /\Aimage\/.*\z/
end
