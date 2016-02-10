require 'rufus-scheduler'

class RemindersController < ApplicationController
  def index
    @minutes = params[:min]
    @phone = params[:phone]
    @start_station = params[:station]
    
    send_text("Thanks! We'll text you 10min, 5min, and 1min before your train arrives.")

    scheduler = Rufus::Scheduler.new

    if @minutes.to_i > 10
      scheduler.in (@minutes.to_i - 10).to_s + 'm' do
        send_text("Your train arrives in 10 minutes.")
      end
    end     

    if @minutes.to_i > 5
      scheduler.in (@minutes.to_i - 5).to_s + 'm' do
        send_text("Your train arrives in 5 minutes.")
      end
    end

    if @minutes.to_i > 1
      scheduler.in (@minutes.to_i - 1).to_s + 'm' do
        send_text("Your train is 1 minute away. Run!")
      end
    end

  end

private

  def send_text(content)
    account_sid = ENV["twilio_account_sid"]
    auth_token = ENV["twilio_auth_token"]

    if user_signed_in?
      @contact = '+1' + current_user.phone
    else
      @contact = '+1' + @phone
    end

    # set up a client to talk to the Twilio REST API 
    @client = Twilio::REST::Client.new account_sid, auth_token 
     
    @client.account.messages.create({
      :from => '+17816763241', 
      :to => @contact, 
      :body => content
    })
  end

end
