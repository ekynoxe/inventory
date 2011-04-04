filename = File.join(File.dirname(__FILE__), '..', 'email.yml')
if File.file?(filename)
  mailconfig = YAML::load_file(filename)

  if mailconfig.is_a?(Hash) && mailconfig.has_key?(Rails.env)
    # Enable deliveries
    ActionMailer::Base.perform_deliveries = true
    
    mailconfig[Rails.env].each do |k, v|
      v.symbolize_keys! if v.respond_to?(:symbolize_keys!)
      ActionMailer::Base.send("#{k}=", v)
    end
  end
end

mailfilename = File.join(File.dirname(__FILE__), '..', 'default_email.yml')
if File.file?(mailfilename)
  appmail = YAML::load_file(mailfilename)
  
  if appmail.is_a?(Hash) && appmail.has_key?(Rails.env)
    appmail[Rails.env].each do |k, v|
      v.symbolize_keys! if v.respond_to?(:symbolize_keys!)
      APP_SENDER_EMAIL=v
    end
  end
end