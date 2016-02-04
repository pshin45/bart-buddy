class RemindersController < ApplicationController
  def index
    @minutes = params[:min]
  end

  def send_text
    account_sid = 'AC096c22a4dfe0e82ea34f0d77d1f7c790' 
    auth_token = '39af644d26e971c836e8e616318d9c17' 

    @contact = '+1' + User.find(1).phone

    # set up a client to talk to the Twilio REST API 
    @client = Twilio::REST::Client.new account_sid, auth_token 
     
    @client.account.messages.create({
      :from => '+17816763241', 
      :to => @contact, 
      :body => 'jigga what'
    })

    redirect_to reminder_path
  end

end
