class PokeDesksController < ApplicationController
  before_action :set_poke_desk, only: [:levelup]

  def index
    @user = User.find(params[:user_id])
    @poke_desks = PokeDesk.where(user: @user).order(:id)

    @pokemons = Pokemon.all
    @pokemons = Pokemon.filter_by_name(params[:search]) if params[:search].present?
  end

  def create
    @poke_desk = PokeDesk.new(poke_desk_params)
    @poke_desk.user_id = params[:user_id]

    respond_to do |format|
      if @poke_desk.save
        format.html { redirect_to user_poke_desks_path(params[:user_id]), notice: 'Poke desk was successfully created.' }
        format.json { render :show, status: :created, location: @poke_desk }
      else
        format.html { render :new }
        format.json { render json: @poke_desk.errors, status: :unprocessable_entity }
      end
    end
  end

  def levelup
    @poke_desk.level += 1
    @poke_desk.save
    redirect_to user_poke_desks_path(@poke_desk.user)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_poke_desk
      @poke_desk = PokeDesk.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def poke_desk_params
      params.require(:poke_desk).permit(:level, :pokemon_id)
    end
end
