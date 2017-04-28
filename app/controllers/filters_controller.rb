class FiltersController < ApplicationController

def new
 @filter = Filter.new
end

def create

@filter = Filter.new(filter_params)

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
