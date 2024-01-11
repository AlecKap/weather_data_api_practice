class WelcomeController < ApplicationController
  def index
    @facade = IqairFacade.new
  end
end