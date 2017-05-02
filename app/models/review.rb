class Review < ActiveRecord::Base
#Reviews belongs to a game
  belongs_to :game
#Reviews belongs to a user
  belongs_to :user

#validation for reviews
  validates :rating, :comment, :presence => true
  validates :comment, :length => {:minimum => 4 }
end
