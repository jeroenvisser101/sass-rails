# Configure Rails Envinronment
ENV["RAILS_ENV"] = "test"

require 'rails'
require "rails/test_help"
require 'sass/rails'
require 'sfl'
require 'mocha'

Rails.backtrace_cleaner.remove_silencers!


# If developing against local dependencies, this code will ensure they get picked up
# in the project fixtures that have their own bundle environment
$gem_locations = {}
possible_dev_dependencies = %w(sass-rails sass rails actionpack railties sprockets)
Bundler.load.specs.each do |s|
  if possible_dev_dependencies.include?(s.name)
     gem_path = s.full_gem_path
     if File.exists?("#{gem_path}/#{s.name}.gemspec")
       $gem_locations[s.name] = gem_path
     end
  end
end

# Load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }
