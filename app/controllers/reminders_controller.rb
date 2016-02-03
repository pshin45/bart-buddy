class RemindersController < ApplicationController
  def index
    @minutes = params[:min]
  end
end
