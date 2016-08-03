class SightingsController < ApplicationController
  before_action :set_sighting, only: [:edit, :update, :destroy]
  before_action :set_pokemon

  load_and_authorize_resource :pokemon
  load_and_authorize_resource :sighting, through: :pokemon

  def new
    @sighting = Sighting.new
  end

  def edit
  end

  def create
    @sighting = Sighting.new(sighting_params)
    @sighting.pokemon = @pokemon

    respond_to do |format|
      if @sighting.save
        format.html { redirect_to pokemon_path(@pokemon), notice: 'Sighting was successfully created.' }
        format.json { render :show, status: :created, location: @sighting }
      else
        format.html { redirect_to pokemon_path(@pokemon), alert: 'Sighting wasnt created.'  }
        format.json { render json: @sighting.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @sighting.update(sighting_params)
        format.html { redirect_to pokemon_path(@pokemon), notice: 'Sighting was successfully updated.' }
        format.json { render :show, status: :ok, location: @sighting }
      else
        format.html { redirect_to pokemon_path(@pokemon), alert: 'Sighting wasnt updated.' }
        format.json { render json: @sighting.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @sighting.destroy
    respond_to do |format|
      format.html { redirect_to pokemon_path(@pokemon), notice: 'Sighting was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sighting
      @sighting = Sighting.find(params[:id])
    end

    def set_pokemon
      @pokemon = Pokemon.find(params[:pokemon_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sighting_params
      params.require(:sighting).permit(:information, :picture, :pokemon_id, :remote_picture_url)
    end
end
