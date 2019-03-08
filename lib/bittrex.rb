require 'bittrex/version'
require 'logger'

module Bittrex
  autoload :Api, 'bittrex/api'
  autoload :Client, 'bittrex/client'
  autoload :Clientable, 'bittrex/clientable'
  autoload :Configuration, 'bittrex/configuration'
  autoload :V2, 'bittrex/v2'
  autoload :V3, 'bittrex/v3'

  class << self
    def client
      @client ||= Client.new(configuration.auth)
    end

    def config
      yield configuration
      @client = Client.new(configuration.auth)
    end

    def configuration
      Configuration.instance
    end

    def root
      File.expand_path('../..', __FILE__)
    end

    def logger
      @logger ||= Logger.new((ENV['BITTREX_LOGGER'] == 'true') ? STDOUT : nil)
    end

    def logger=(logger)
      @logger = logger
    end
  end
end
