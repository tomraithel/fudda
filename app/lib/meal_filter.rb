class MealFilter
  include ActiveModel::Model
  include MultiparameterAttributeAssignment

  attr_accessor :day_from
  attr_accessor :day_to

  def initialize(*params)
    super(*params)
    self.day_from = DateTime.now.to_date if self.day_from.nil?
    self.day_to = (DateTime.now + 14).to_date if self.day_to.nil?
  end

  def class_for_attribute(name)
    Date if %w[day_from day_to].include?(name)
  end

end