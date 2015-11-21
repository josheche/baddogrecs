class MessageMailer < ApplicationMailer
  # insert email address here
  default :to => "josheche@gmail.com"
  def message_me(msg)
    @msg = msg

    mail from: @msg.email, subject: @msg.subject, body: @msg.content
  end
end
