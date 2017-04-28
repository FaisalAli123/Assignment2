class User < ActiveRecord::Base
#Users have many games
  has_many :games
#Users have many reviews
  has_many :reviews
#Users have many filters/genres
  has_many :filters

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
