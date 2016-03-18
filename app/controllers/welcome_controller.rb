class WelcomeController < ApplicationController
  def index

    calendar = TickTack::Calendar.new(nil, {dow: 1})
    @today_date = DateTime.now.to_date

    if params[:day]
      d = Date.parse(params[:day])
      @day = calendar.day(d.year, d.month, d.day)
    else
      @day = calendar.day()
    end
  end
end
