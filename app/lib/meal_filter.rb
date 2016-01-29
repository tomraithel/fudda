class MealFilter
  include ActiveModel::Model
  include MultiparameterAttributeAssignment

  attr_accessor :day_from
  attr_accessor :day_to

  def class_for_attribute(name)
    Date if %w[day_from day_to].include?(name)
  end

end