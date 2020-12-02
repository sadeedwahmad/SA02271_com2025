class ApplicationMailer < ActionMailer::Base
  default to: 'info@myProject.com'
  default from: 'info@myProject.com'
  layout 'mailer'
end
