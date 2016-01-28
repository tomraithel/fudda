class WelcomeController < ApplicationController
  def index
    @month = TickTack::Calendar.new(nil, {dow: 1}).month
  end
end
