class GamesController < ApplicationController
# This function will take place before any of the functions
  before_action :find_game, only: [:show, :edit, :update, :destroy]
# Only users signed in can create new and edit games
  before_action :authenticate_user!, only: [:new, :edit]

#Displays all games in descending order
  def index
    if params[:filter].blank?
      @games = Game.all.order("created_at DESC")
    else
      @filter_id = Filter.find_by(name: params[:filter]).id
      @games = Game.where(:filter_id => @filter_id).order("created_at DESC")
    end
  end

#This function averages the ratings
  def show
    if @game.reviews.blank?
      @average_review = 0
    else
      @average_review = @game.reviews.average(:rating).round(2)
    end
  end

#Links to current user and show all filters
  def new
    @game = current_user.games.build
    @filters = Filter.all.map{ |c| [c.name, c.id] }
  end

#This action creates new game and shows and saves game to database
  def create
    @game = current_user.games.build(game_params)
    @game.filter_id = params[:filter_id]
    if @game.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    @filters = Filter.all.map{ |c| [c.name, c.id] }
  end

#This action updates game
  def update
    @game.filter_id = params[:filter_id]
    if @game.update(game_params)
      redirect_to game_path(@game)
    else
      render 'edit'
    end
  end

#This action deletes game
  def destroy
    @game.destroy
    redirect_to root_path
  end


  private
#Defining game parameters and permiting certain fields
    def game_params
      params.require(:game).permit(:name, :description, :developer, :filter_id, :game_img)
    end

#Find game by ID
    def find_game
      @game = Game.find(params[:id])
    end
end
