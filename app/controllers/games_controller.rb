class GamesController < ApplicationController

  def index
    @games = Game.all.order("created_at DESC")
  end

  def show
    @game = Game.find(params[:id])
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)

    if @game.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

    def game_params
      params.require(:game).permit(:name, :description, :developer)
    end
end
