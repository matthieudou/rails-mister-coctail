class CocktailsController < ApplicationController

  before_action :set_cocktail, only: [:show]

  def index
    @cocktails = Cocktail.all
  end

  def show
    @doses = @cocktail.doses
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktails_params)
    if @cocktail.valid?
      @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new, locals: { cocktail: @cocktail }
    end
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def cocktails_params
    params.require(:cocktail).permit(:name)
  end

# TO IMPLEMENT LATER !
  # def edit
  # end

  # def update
  # end
end
