class Filter < ActiveRecord::Base
#filter has many games
  has_many :games
end
