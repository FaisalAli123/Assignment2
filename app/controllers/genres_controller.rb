class GenresController < ApplicationController

def new
 @genre = Genre.new
end

def create

@genre = Genre.new(genre_params)
end

private

def genre_params
params.require(:genre).permit(:name)
end

end
