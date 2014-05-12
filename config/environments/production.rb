##### DEV ###################
Prietary::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Log error messages when you accidentally call methods on nil.
  config.whiny_nils = true

  # Show full error reports and disable caching
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # ActionMailer Config
  config.action_mailer.default_url_options = { :host => 'localhost:3000' }
  config.action_mailer.delivery_method = :smtp
  # change to true to allow email to be sent during development
  config.action_mailer.perform_deliveries = false  # Doesn't turn off emails??  ############# need this true to send email ##########
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.default :charset => "utf-8"


  # Print deprecation notices to the Rails logger
  config.active_support.deprecation = :log

  # Only use best-standards-support built into browsers
  config.action_dispatch.best_standards_support = :builtin


  # Do not compress assets
  config.assets.compress = false

  # Expands the lines which load the assets
  config.assets.debug = true

  config.action_mailer.smtp_settings = {
    address: "smtp.gmail.com",
    port: 587,
    domain: "gmail.com",  #domain: ENV["DOMAIN_NAME"],
    authentication: "plain",
    enable_starttls_auto: true,
    user_name: "wronguser", #ENV["GMAIL_USERNAME"],
    password: "wrongpass" #ENV["GMAIL_PASSWORD"]
  }

end




############ PRODUCTION ##############################
# Prietary::Application.configure do
#   # Settings specified here will take precedence over those in config/application.rb

#   # Code is not reloaded between requests
#   config.cache_classes = true

#   # Full error reports are disabled and caching is turned on
#   config.consider_all_requests_local       = false
#   config.action_controller.perform_caching = true

#   # Disable Rails's static asset server (Apache or nginx will already do this)
#   config.serve_static_assets = false

#   # Compress JavaScripts and CSS
#   config.assets.compress = true

#   # Don't fallback to assets pipeline if a precompiled asset is missed
#   config.assets.compile = false

#   # Generate digests for assets URLs
#   config.assets.digest = true

#   # Defaults to nil and saved in location specified by config.assets.prefix
#   # config.assets.manifest = YOUR_PATH

#   # Specifies the header that your server uses for sending files
#   # config.action_dispatch.x_sendfile_header = "X-Sendfile" # for apache
#   # config.action_dispatch.x_sendfile_header = 'X-Accel-Redirect' # for nginx

#   # Force all access to the app over SSL, use Strict-Transport-Security, and use secure cookies.
#   # config.force_ssl = true  # PG todo: per railstutorial, uncomment this

#   # See everything in the log (default is :info)
#   # config.log_level = :debug

#   # Prepend all log lines with the following tags
#   # config.log_tags = [ :subdomain, :uuid ]

#   # Use a different logger for distributed setups
#   # config.logger = ActiveSupport::TaggedLogging.new(SyslogLogger.new)

#   # Use a different cache store in production
#   # config.cache_store = :mem_cache_store

#   # Enable serving of images, stylesheets, and JavaScripts from an asset server
#   # config.action_controller.asset_host = "http://assets.example.com"

#   # Precompile additional assets (application.js, application.css, and all non-JS/CSS are already added)
#   # config.assets.precompile += %w( search.js )

#   # Disable delivery errors, bad email addresses will be ignored
#   # config.action_mailer.raise_delivery_errors = false

#   # Enable threaded mode
#   # config.threadsafe!

#   # Enable locale fallbacks for I18n (makes lookups for any locale fall back to
#   # the I18n.default_locale when a translation can not be found)
#   config.i18n.fallbacks = true

#   # Send deprecation notices to registered listeners
#   config.active_support.deprecation = :notify

#   config.action_mailer.smtp_settings = {
#     address: "smtp.gmail.com",
#     port: 587,
#     domain: ENV["DOMAIN_NAME"],
#     authentication: "plain",
#     enable_starttls_auto: true,
#     user_name: ENV["GMAIL_USERNAME"],
#     password: ENV["GMAIL_PASSWORD"]
#   }


#   config.action_mailer.default_url_options = { :host => 'prietary.com' }
#   # ActionMailer Config
#   # Setup for production - deliveries, no errors raised
#   config.action_mailer.delivery_method = :smtp
#   config.action_mailer.perform_deliveries = true
#   config.action_mailer.raise_delivery_errors = false
#   config.action_mailer.default :charset => "utf-8"


# end
