class ReviewsController < ApplicationController
# This function will take place before any of the functions
  before_action :find_game
  before_action :find_review, only: [:edit, :update, :destroy]
#Only users signed in can create new and edit review
  before_action :authenticate_user!, only: [:new, :edit]

#This action links to review
  def new
    @review = Review.new
  end

#This action creates new review and saves it
  def create
    @review = Review.new(review_params)
    @review.game_id = @game.id
    @review.user_id = current_user.id

    if @review.save
      redirect_to game_path(@game)
    else
      render 'new'
    end
  end

  def edit
  end

#This action updates the new review
  def update
    if @review.update(review_params)
      redirect_to game_path(@game)
    else
      render 'edit'
    end
  end

#This action deletes the review adn redirects to game page
  def destroy
    @review.destroy
    redirect_to game_path(@game)
  end

  private
#Defining review parameters and permiting rating and comment
    def review_params
      params.require(:review).permit(:rating, :comment)
    end
#This action finds game by game ID
    def find_game
      @game = Game.find(params[:game_id])
    end
#This action finds review by review ID
    def find_review
      @review = Review.find(params[:id])
    end
end
