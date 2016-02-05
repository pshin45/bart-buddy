require 'bart/station'
require 'twilio-ruby'

class TrainsController < ApplicationController
  def create
    @start_station = Bart::Station.new(abbr: params[:trip][:start_station])
    @phone = params[:trip][:phone]
  end
end
