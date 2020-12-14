class HomeController < ApplicationController
  def home
  end

  def request_contact #used for contact page, imitaites mailer
    name = params[:name]
    email = params[:email]
    telephone = params[:telephone]
    message = params[:message]
    if email.blank?
      flash[:alert] = I18n.t('request_contact.no_email')
    else
      ContactMailer.contact_email(email, name, telephone, message).deliver_now  #connects with contact mailer
      flash[:notice] = I18n.t('request_contact.email_sent')
    end
    redirect_to root_path
  end




  def contact
  end
end
