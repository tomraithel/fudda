class IngredientsController < ApplicationController
  before_action :set_receipe
  before_action :set_ingredient, only: [:show, :edit, :update, :destroy]

  # GET /ingredients/1/edit
  def edit
  end

  # GET /ingredients/1/new
  def new
  end

  # POST /ingredients
  # POST /ingredients.json
  def create
    @ingredient = Ingredient.new(ingredient_params)

    respond_to do |format|
      if @ingredient.save
        format.html { redirect_to edit_receipe_url(@receipe), notice: 'Ingredient was successfully created.' }
        format.json { render :show, status: :created, location: @ingredient }
      else
        format.html { render :new }
        format.json { render json: @ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ingredients/1
  # DELETE /ingredients/1.json
  def destroy
    @ingredient.destroy
    respond_to do |format|
      format.html { redirect_to edit_receipe_url(@receipe), notice: 'Ingredient was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_receipe
      @receipe = Receipe.find(params[:receipe_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_ingredient
      @ingredient = Ingredient.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ingredient_params
      params
          .require(:ingredient)
          .permit(:quantity, :product_id)
          .merge({receipe_id: @receipe.id})
    end
end
