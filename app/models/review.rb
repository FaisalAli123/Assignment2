class Review < ActiveRecord::Base
#Reviews belongs to a game
  belongs_to :game
#Reviews belongs to a user
  belongs_to :user
end
