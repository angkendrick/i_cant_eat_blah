class Admin::IngredientsController < ApplicationController

  def index
    @ingredients = Ingredient.all
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(secure_params)

    if @ingredient.save
      redirect_to admin_ingredients_path, notice: "Added #{@ingredient.name}"
    else
      render :new
    end
  end

  def edit
    @ingredient = Ingredient.find(params[:id])
  end

  def show

  end

  def update
    @ingredient = Ingredient.find(params[:id])
    @ingredient.update(secure_params)

    if @ingredient.save
      redirect_to admin_ingredients_path, notice: 'updated'
    else
      render :edit
    end

  end

  def destroy
    @ingredient = Ingredient.find(params[:id])

    if @ingredient.destroy
      redirect_to admin_ingredients_path, notice: "#{@ingredient.name} deleted! "
    else
      redirect_to admin_ingredients_path, notice: "failed to delete #{@ingredients.name}"
    end

  end

  protected

  def secure_params
    params.require(:ingredient).permit(:name)
  end

end
