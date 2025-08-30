ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

module ActiveSupport
  class TestCase
    # Run tests in parallel with specified workers
    parallelize(workers: :number_of_processors)

    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    ActiveSupport::TestCase.fixture_paths = [ Rails.root.join("test/fixtures") ]
    fixtures :all

    # Add more helper methods to be used by all tests here...
  end
end
