class FiltersController < ApplicationController
# Only users can add genres
before_action :authenticate_user!, only: [:new]

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

private
#Defining filter parameters and permiting filter name
def filter_params
params.require(:filter).permit(:name)
end

end
