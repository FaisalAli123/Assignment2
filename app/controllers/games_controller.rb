class GamesController < ApplicationController
  before_action :find_game, only: [:show, :edit, :update, :destroy]

  def index
    if params[:filter].blank?
      @games = Game.all.order("created_at DESC")
    else
      @filter_id = Filter.find_by(name: params[:filter]).id
      @games = Game.where(:filter_id => @filter_id).order("created_at DESC")
    end
  end

  def show
  end

  def new
    @game = current_user.games.build
    @filters = Filter.all.map{ |c| [c.name, c.id] }
  end

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

  def update
    @game.filter_id = params[:filter_id]
    if @game.update(game_params)
      redirect_to game_path(@game)
    else
      render 'edit'
    end
  end

  def destroy
    @game.destroy
    redirect_to root_path
  end

  private

    def game_params
      params.require(:game).permit(:name, :description, :developer, :filter_id)
    end

    def find_game
      @game = Game.find(params[:id])
    end
end
