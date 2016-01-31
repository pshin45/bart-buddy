require 'bart/station'

class TrainsController < ApplicationController
  def create
    @start_station = Bart::Station.new(abbr: params[:trip][:start_station])
    @direction = Bart::Station.new(abbr: params[:trip][:direction])
  end
end
