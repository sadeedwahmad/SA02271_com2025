class ContactMailer < ApplicationMailer
  def contact_email(email, name, telephone, message)
    @email = email
    @name = name
    @telephone = telephone
    @message = message


    mail(cc: @email, subject: @name + @telephone, body: @message)
  end


end
