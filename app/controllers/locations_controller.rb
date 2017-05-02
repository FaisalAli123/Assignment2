class LocationsController < ApplicationController
  before_action :set_location, only: [:show, :edit, :update, :destroy]

# get locations.json
def index
    @locations = Location.all
end

def search
    if params[:search].present?
      @location = params[:search]
      location = Geocoder.coordinates(params[:search])
      @latitude = location[0]
      @longitude = location[1]
  end
end

def show
end

# get locations new
def new
    @location = Location.new
end

# edit locations
def edit
end


#create new location and save
def create
  @location = Location.new(location_params)

  respond_to do |format|
    if @location.save
      format.html { redirect_to @location, notice: 'Location was successfully created.' }
      format.json { render :show, status: :created, location: @location }
    else
      format.html { render :new }
      format.json { render json: @location.errors, status: :unprocessable_entity }
    end
  end
end

#update new location
def update
  respond_to do |format|
    if @location.update(location_params)
      format.html { redirect_to @location, notice: 'Location was successfully updated.' }
      format.json { render :show, status: :ok, location: @location }
    else
      format.html { render :edit }
      format.json { render json: @location.errors, status: :unprocessable_entity }
    end
  end
end

#delete location
def destroy
  @location.destroy
  respond_to do |format|
    format.html { redirect_to locations_url, notice: 'Location was successfully deleted.' }
    format.json { head :no_content }
  end
end

private
# Use callbacks to share common setup or constraints between actions.
def set_location
    @location = Location.find(params[:id])
end


def location_params
    params.require(:location).permit(:address, :latitude, :longitude)
  end
end
