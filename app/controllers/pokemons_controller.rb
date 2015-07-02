class PokemonsController < ApplicationController
  before_action :set_pokemon, only: [:show, :create, :edit, :update, :destroy]

  def index
    render json: Pokemon.all
  end

  def show
    if @pokemon
      render json: @pokemon
    else
      render json: { status: 404 }
    end
  end

  def create
    @pokemon = Pokemon.new(pokemon_params)
    respond_to do |format|
      if @pokemon.save
        format.json { render :show, status: :created, location: @pokemon }
      else
        format.json { render json: @pokemon.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @pokemon.update(pokemon_params)
        format.json { render :show, status: :ok, location: @pokemon }
      else
        format.json { render json: @pokemon.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @pokemon.destroy
    respond_to do |format|
      # format.html { redirect_to pokemons_url, notice: 'Pokemon was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pokemon
      @pokemon = Pokemon.find_by(ndex: params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pokemon_params
      params.require(:pokemon).permit(:n_dex, :name, :type, :photo_url)
    end
end
