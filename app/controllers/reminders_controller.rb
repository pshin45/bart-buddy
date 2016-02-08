require 'rufus-scheduler'

class RemindersController < ApplicationController
  def index
    @minutes = params[:min]
    @phone = params[:phone]
    send_text_0

    # scheduler = Rufus::Scheduler.new

    # if @minutes.to_i > 10
    #   scheduler.in (@minutes.to_i - 10).to_s + 'm' do
    #     send_text_1
    #   end
    # end     

    # if @minutes.to_i > 5
    #   scheduler.in (@minutes.to_i - 5).to_s + 'm' do
    #     send_text_2
    #   end
    # end

    # if @minutes.to_i > 1
    #   scheduler.in (@minutes.to_i - 1).to_s + 'm' do
    #     send_text_3
    #   end
    # end
  end


private

  def send_text_0
    account_sid = 'AC096c22a4dfe0e82ea34f0d77d1f7c790' 
    auth_token = '39af644d26e971c836e8e616318d9c17' 

    if user_signed_in?
      @contact = '+1' + User.find(params[:id]).phone
    else
      @contact = '+1' + @phone
    end

    # set up a client to talk to the Twilio REST API 
    @client = Twilio::REST::Client.new account_sid, auth_token 
     
    @client.account.messages.create({
      :from => '+17816763241', 
      :to => @contact, 
      :body => 'Thanks! Expect an SMS 10min, 5min, and 1min before your train arrives.'
    })
  end

  def send_text_1
    account_sid = 'AC096c22a4dfe0e82ea34f0d77d1f7c790' 
    auth_token = '39af644d26e971c836e8e616318d9c17' 

    @contact = '+1' + User.find(1).phone

    # set up a client to talk to the Twilio REST API 
    @client = Twilio::REST::Client.new account_sid, auth_token 
     
    @client.account.messages.create({
      :from => '+17816763241', 
      :to => @contact, 
      :body => '10 min away!'
    })
  end

  def send_text_2
    account_sid = 'AC096c22a4dfe0e82ea34f0d77d1f7c790' 
    auth_token = '39af644d26e971c836e8e616318d9c17' 

    @contact = '+1' + User.find(1).phone

    # set up a client to talk to the Twilio REST API 
    @client = Twilio::REST::Client.new account_sid, auth_token 
     
    @client.account.messages.create({
      :from => '+17816763241', 
      :to => @contact, 
      :body => '5 min away!'
    })
  end

  def send_text_3
    account_sid = 'AC096c22a4dfe0e82ea34f0d77d1f7c790' 
    auth_token = '39af644d26e971c836e8e616318d9c17' 

    @contact = '+1' + User.find(1).phone

    # set up a client to talk to the Twilio REST API 
    @client = Twilio::REST::Client.new account_sid, auth_token 
     
    @client.account.messages.create({
      :from => '+17816763241', 
      :to => @contact, 
      :body => '1 min away! run!'
    })
  end

end
