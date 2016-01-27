class WelcomeController < ApplicationController
  def index
    @date = Cal::Month.new()
  end
end
