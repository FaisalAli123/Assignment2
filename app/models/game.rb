class Game < ActiveRecord::Base
#game belongs to a user
  belongs_to :user
#game belongs to a filter/genre
  belongs_to :filter
#games can have many reviews
  has_many :reviews

#image upload
  has_attached_file :game_img, styles: { game_index: "250x350>", game_show: "325x475>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :game_img, content_type: /\Aimage\/.*\z/
end
