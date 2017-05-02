class FiltersController < ApplicationController
# Only users can add genres and edit and delete
before_action :authenticate_user!, only: [:new]
before_action :find_filter, only: [:show, :edit, :update, :destroy]

#show all genres in descending order
def index
  @filters = Filter.all.order("created_at DESC")
end

#This action links with current user
def new
 @filter = current_user.filters.build
end

#This action creates new filter and saves to the datbase
def create

@filter = current_user.filters.build(filter_params)
#If filter get saved it redirects to game page
if @filter.save
  redirect_to games_path(@game)
else
  render 'new'
end
end

def edit
end

#when edited the genre is updated
def update
  if @filter.update(filter_params)
    redirect_to filter_path(@filter)
  else
    render 'edit'
  end
end

#deletes genre
def destroy
  @filter.destroy
  redirect_to filters_path
end

private
#Defining filter parameters and permiting filter name
def filter_params
params.require(:filter).permit(:name, :game_id)
end

def find_filter
  @filter = Filter.find(params[:id])
end

end
