require 'rest-client'
require 'faraday'
require 'base64'
require 'json'
require 'openssl'

module Bittrex
  class Client
    HOST = 'https://bittrex.com'
    V1_PREFIX = '/api/v1.1'
    V2_PREFIX = '/api/v2.0'
    attr_reader :key, :secret

    def initialize(attrs = {})
      @key = attrs[:key]
      @secret = attrs[:secret]
    end

    def get(path, params = {})
      read_timeout, open_timeout = params.delete(:read_timeout){3}, params.delete(:open_timeout){2}

      nonce = Time.now.to_i
      query1 = Faraday::Utils::ParamsHash[:apikey, key, :nonce, nonce].to_query(Faraday::FlatParamsEncoder)
      query2 = Faraday::Utils::ParamsHash.new.merge!(params).to_query(Faraday::FlatParamsEncoder)
      query = [query1, query2].compact.reject{|i| i.empty?} * '&'
      url = ["#{HOST}#{V1_PREFIX}/#{path}",query].compact * '?'

      response = RestClient::Request.execute(method: :get, url: url, headers: {apisign: signature(url)}, open_timeout: open_timeout, read_timeout: read_timeout)

      JSON.parse(response.body)
    end

    def get_v2(path, params = {})
      nonce = Time.now.to_i
      query1 = Faraday::Utils::ParamsHash[:apikey, key, :nonce, nonce].to_query(Faraday::FlatParamsEncoder)
      query2 = Faraday::Utils::ParamsHash.new.merge!(params).to_query(Faraday::FlatParamsEncoder)
      query = [query1, query2].compact.reject{|i| i.empty?} * '&'
      url = ["#{HOST}#{V2_PREFIX}/#{path}",query].compact * '?'

      response = RestClient.get(url, apisign: signature(url))

      json = JSON.parse(response.body)
      raise json.to_s unless json['success']
      json['result']
    end

    def post(path, params = {})
      nonce = Time.now.to_i
      query1 = Faraday::Utils::ParamsHash[:apikey, key, :nonce, nonce].to_query(Faraday::FlatParamsEncoder)
      query = [query1].compact.reject{|i| i.empty?} * '&'
      url = ["#{HOST}#{V1_PREFIX}/#{path}",query].compact * '?'

      response = RestClient.post(url, params, apisign: signature(url))

      json = JSON.parse(response.body)
      raise json.to_s unless json['success']
      json['result']
    end

    private

    def signature(url)
      ::OpenSSL::HMAC.hexdigest 'sha512', secret, url
    end

    def connection
      @connection ||= Faraday.new(:url => HOST) do |faraday|
        faraday.request :url_encoded
        faraday.adapter Faraday.default_adapter
      end
    end
  end
end
