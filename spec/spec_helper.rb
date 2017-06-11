require 'simplecov'
SimpleCov.start

require 'rspec'
require 'bittrex'

Dir[File.join(Bittrex.root, 'spec/fixtures/**/*.rb')].each { |f| require f }
Dir[File.join(Bittrex.root, 'spec/support/**/*.rb')].each {|f| require f}

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = [:should, :expect]
  end

  config.mock_with :mocha
end

def fixture(resource)
  path = File.join(Bittrex.root, "spec/fixtures/#{resource}.json")
  JSON.parse File.read(path)
end

def should_assign_attribute(subject, method, value)
  subject.send(method).should eq(value)
end
