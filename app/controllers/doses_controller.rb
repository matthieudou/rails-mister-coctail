class DosesController < ApplicationController

  before_action :set_dose, only: [:destroy]
  before_action :set_cocktail, only: [:new, :create]

  def new
    @ingredients = Ingredient.all
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    if @dose.valid?
      @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new, locals: { dose: @dose }
    end
  end

  def destroy
    @dose.destroy
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end

  def set_dose
    @dose = Dose.find(params[:id])
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end
end
