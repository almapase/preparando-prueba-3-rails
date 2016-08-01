class SightingsController < ApplicationController
  before_action :set_sighting, only: [:edit, :update, :destroy]


  # GET /sightings/new
  def new
    @sighting = Sighting.new
    @pokemon = Pokemon.find(params[:pokemon_id])
  end

  # GET /sightings/1/edit
  def edit
  end

  # POST /sightings
  # POST /sightings.json
  def create
    @sighting = Sighting.new(sighting_params)
    @sighting.pokemon_id = params[:pokemon_id]

    respond_to do |format|
      if @sighting.save
        format.html { redirect_to pokemons_path, notice: 'Sighting was successfully created.' }
        format.json { render :show, status: :created, location: @sighting }
      else
        format.html { redirect_to pokemons_path, alert: 'Sighting wasnt created.'  }
        format.json { render json: @sighting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sightings/1
  # PATCH/PUT /sightings/1.json
  def update
    respond_to do |format|
      if @sighting.update(sighting_params)
        format.html { redirect_to pokemons_path, notice: 'Sighting was successfully updated.' }
        format.json { render :show, status: :ok, location: @sighting }
      else
        format.html { render :edit }
        format.json { render json: @sighting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sightings/1
  # DELETE /sightings/1.json
  def destroy
    @sighting.destroy
    respond_to do |format|
      format.html { redirect_to pokemons_url, notice: 'Sighting was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sighting
      @sighting = Sighting.find(params[:id])
      @pokemon = Pokemon.find(params[:pokemon_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sighting_params
      params.require(:sighting).permit(:information, :picture, :pokemon_id)
    end
end
