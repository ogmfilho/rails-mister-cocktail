class CocktailsController < ApplicationController

  def index
    @cocktails = Cocktail.all
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)

    if @cocktail.save
      redirect_to @cocktail, notice: 'Cocktail was successfully created.'
    else
      render :new
    end

  end

  def show
    @cocktail = Cocktail.find(params[:id])
  end

  def edit
    @cocktail = Cocktail.find(params[:id])
  end

  def update
    @cocktail = Cocktail.find(params[:id])
    if @cocktail.update(cocktail_params)
      redirect_to @cocktail, notice: 'cocktail was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @cocktail = Cocktail.find(params[:id])
    @cocktail.destroy
    redirect_to cocktails_url, notice: 'Cocktail was successfully deleted.'
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo)
  end

end
