Paypal::Application.configure do
  # Settings specified here will take precedence over those in config/environment.rb

  # In the development environment your application's code is reloaded on
  # every request.  This slows down response time but is perfect for development
  # since you don't have to restart the webserver when you make code changes.
  config.cache_classes = false

  # Log error messages when you accidentally call methods on nil.
  config.whiny_nils = true

  # Show full error reports and disable caching
  config.consider_all_requests_local       = true
  config.action_view.debug_rjs             = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send
  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger
  config.active_support.deprecation = :log

  # Only use best-standards-support built into browsers
  config.action_dispatch.best_standards_support = :builtin

  config.after_initialize do
  ActiveMerchant::Billing::Base.mode = :test
  paypal_options = {
    :login => "admila_1293364408_biz_api1.gmail.com",
    :password => "1293364423",
    :signature => "AQU0e5vuZCvSg-XJploSa.sGUDlpAI-AVy-GeBLOqTWUpmrhT4Z4PekM"
  }
  ::STANDARD_GATEWAY = ActiveMerchant::Billing::PaypalGateway.new(paypal_options)
  ::EXPRESS_GATEWAY = ActiveMerchant::Billing::PaypalExpressGateway.new(paypal_options)
end
#paypal_options = {:login =>ask4pr_1293561273_biz_api1.gmail.com, :password => "CK8M5ZEQ66RP4SG6", :signature=> "An5ns1Kso7MWUdW4ErQKJJJ4qi4-AhGnn-DY-N3Adr4VJBDkRPcZEMH8"}

end

