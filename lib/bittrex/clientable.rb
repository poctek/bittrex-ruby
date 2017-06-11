module Bittrex
  module Clientable
    def self.included(base)
      base.extend ClassMethods
    end

    module ClassMethods
      private
      def client
        @client ||= Bittrex.client
      end
    end
  end
end

