class Filter < ActiveRecord::Base
#filter has many games
  has_many :games

#validation for genres
validates :name, :presence => true
validates :name, :length => { :minimum => 4 }
validates :name, :uniqueness => { :message => "Already Been Used"}
end
