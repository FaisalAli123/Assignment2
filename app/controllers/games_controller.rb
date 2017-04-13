class GamesController < ApplicationController
  before_action :find_game, only: [:show, :edit, :update, :destroy]

  def index
    @games = Game.all.order("created_at DESC")
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
  end

  def update
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
