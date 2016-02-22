class MealsController < ApplicationController
  before_action :set_meal, only: [:show, :edit, :update, :destroy]

  def meals_by_filter
    Meal.where("day >= ?", @filter.day_from)
        .where("day <= ?", @filter.day_to)
        .order(:day)
  end

  def ingredients_by_filter
    Ingredient.find_by_sql(['
             SELECT i.*, m.day as meal_day FROM ingredients i
               INNER JOIN receipes r ON r.id = i.receipe_id
                 INNER JOIN meals m ON m.receipe_id = r.id
               INNER JOIN products p ON p.id = i.product_id
             WHERE m.day >= ?
             AND m.day <= ?
             ORDER BY p.name
    ', @filter.day_from, @filter.day_to])
  end

  # GET /meals
  # GET /meals.json
  def index
    @filter = MealFilter.new(meal_filter_params)
    if params[:show_ingredients] == 'true'
      @ingredients = ingredients_by_filter
    else
      @meals = meals_by_filter
    end
  end

  # GET /meals/new
  def new
    @meal = Meal.new
    if params[:day]
      @meal.day = Date.parse(params[:day])
    end
  end

  # GET /meals/1/edit
  def edit
  end

  # POST /meals
  # POST /meals.json
  def create
    @meal = Meal.new(meal_params)

    respond_to do |format|
      if @meal.save
        format.html { redirect_to meals_url, notice: 'Meal was successfully created.' }
        format.json { render :show, status: :created, location: @meal }
      else
        format.html { render :new }
        format.json { render json: @meal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /meals/1
  # PATCH/PUT /meals/1.json
  def update
    respond_to do |format|
      if @meal.update(meal_params)
        format.html { redirect_to meals_url, notice: 'Meal was successfully updated.' }
        format.json { render :show, status: :ok, location: @meal }
      else
        format.html { render :edit }
        format.json { render json: @meal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meals/1
  # DELETE /meals/1.json
  def destroy
    @meal.destroy
    respond_to do |format|
      format.html { redirect_to meals_url, notice: 'Meal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meal
      @meal = Meal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def meal_params
      params.require(:meal).permit(:day, :receipe_id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def meal_filter_params
      if params.has_key? :meal_filter
        params.require(:meal_filter).permit(:day_from, :day_to)
      else
        {}
      end
    end
end
