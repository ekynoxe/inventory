class Notifier < ActionMailer::Base
  default_url_options[:host] = "inventory.email.com"

  def device_assignment_notification(sender,device)
    recipients device.holder.email
    from       APP_SENDER_EMAIL
    subject    "You have been assigned the device'"+device.description+"'"
    body       :sender => sender, :recipient => device.holder, :device => device, :mydevices_url=>mydevices_url
  end

  def device_request(sender,device)
    recipients device.holder.email
    from       APP_SENDER_EMAIL
    subject    "The device '"+device.description+"' has been requested by "+sender.name
    body       :sender => sender, :recipient => device.holder, :device => device, :requests_url=>device_requests_url
  end
  
  def password_reset_instructions(holder)
    subject       "Password Reset Instructions"
    from          APP_SENDER_EMAIL
    recipients    holder.email
    sent_on       Time.now
    body          :edit_password_reset_url => edit_password_reset_url(holder.perishable_token)
  end
end
