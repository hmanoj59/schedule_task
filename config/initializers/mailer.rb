# Remember to set these in config/environments/development.rb and production.rb
#
# if Rails.env.development?
#   # Simulates email sending to browser
#   Rails.application.config.action_mailer.raise_delivery_errors = true
#   Rails.application.config.action_mailer.delivery_method = :letter_opener
#   Rails.application.config.action_mailer.perform_deliveries = true
#   Rails.application.config.action_mailer.default_url_options = { host: ENV['APP_HOST'], port: ENV['APP_PORT'] }
# end
#
# if Rails.env.production?
#   Rails.application.config.action_mailer.perform_deliveries = true
#   Rails.application.config.action_mailer.raise_delivery_errors = false
#   Rails.application.config.action_mailer.default_url_options = { host: ENV['APP_HOST'], port: ENV['APP_PORT'] }
# end

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.default :charset => "utf-8"
ActionMailer::Base.smtp_settings = {
  :address        => ENV['SMTP_HOST'],
  :port           => ENV['SMTP_PORT'],
  :authentication => :plain,
  :user_name      => ENV['SMTP_USER'],
  :password       => ENV['SMTP_PASS'],
  :domain         => ENV['SMTP_DOMAIN'],
  :enable_starttls_auto => true
}
