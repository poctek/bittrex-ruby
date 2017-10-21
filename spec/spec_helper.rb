require 'bundler'
Bundler.require(:default, :development)
require 'rspec/collection_matchers'

SimpleCov.start

Dotenv.load('spec/.env') if File.exists? 'spec/.env'

Dir[File.join(Bittrex.root, 'spec/fixtures/**/*.rb')].each { |f| require f }
Dir[File.join(Bittrex.root, 'spec/support/**/*.rb')].each {|f| require f}
Bittrex.logger = Logger.new(STDOUT)
Bittrex.logger.level = Logger::DEBUG

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

