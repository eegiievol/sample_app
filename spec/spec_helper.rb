require 'rubygems'
require 'spork'

Spork.prefork do
  # Loading more in this block will cause your tests to run faster. However, 
  # if you change any configuration or code from libraries loaded here, you'll
  # need to restart spork for it take effect.
  
  # This file is copied to spec/ when you run 'rails generate rspec:install'
  # (davidc) And after installing spork and doing spork --bootstrap, this
  # all goes under Spork.prefork do
  ENV["RAILS_ENV"] ||= 'test'
  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'

  # Requires supporting ruby files with custom matchers and macros, etc,
  # in spec/support/ and its subdirectories.
  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

  RSpec.configure do |config|
    # == Mock Framework
    #
    # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
    #
    # config.mock_with :mocha
    # config.mock_with :flexmock
    # config.mock_with :rr
    config.mock_with :rspec

    # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
    config.fixture_path = "#{::Rails.root}/spec/fixtures"

    # If you're not using ActiveRecord, or you'd prefer not to run each of your
    # examples within a transaction, remove the following line or assign false
    # instead of true.
    config.use_transactional_fixtures = true
    
    # (davidc) Plus this line:
    ActiveSupport::Dependencies.clear
  end
end

Spork.each_run do
  # This code will be run each time you run your specs.
  # (davidc) The Rails 3 Tutorial book was silent on this block, but
  # I got the following from http://mikbe.tk/2011/02/10/blazingly-fast-tests/
  
  # I also like to have it load the routes.rb file so I don’t have to reload 
  # Spork every time I add a new route. When you’re first designing your app 
  # and adding routes every few minutes you’ll get really tired of reloading Spork.
  load "#{Rails.root}/config/routes.rb" 
  Dir["#{Rails.root}/app/**/*.rb"].each { |f| load f }
  
  #... but for some reason it doesn't appear to work for me.
end

# --- Instructions ---
# - Sort through your spec_helper file. Place as much environment loading 
#   code that you don't normally modify during development in the 
#   Spork.prefork block.
# - Place the rest under Spork.each_run block
# - Any code that is left outside of the blocks will be ran during preforking
#   and during each_run!
# - These instructions should self-destruct in 10 seconds.  If they don't,
#   feel free to delete them.
#




