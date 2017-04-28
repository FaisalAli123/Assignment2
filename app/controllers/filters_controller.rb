class FiltersController < ApplicationController
before_action :authenticate_user!, only: [:new]
def new
 @filter = current_user.filters.build
end

def create

@filter = current_user.filters.build(filter_params)

if @filter.save
  redirect_to games_path(@game)
else
  render 'new'
end
end

private

def filter_params
params.require(:filter).permit(:name)
end

end
