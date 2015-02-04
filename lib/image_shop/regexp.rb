require 'uri'

module ImageShop
  module Regexp
    def self.positive_integer
      /^[1-9]\d+$/
    end

    def self.uri
      URI::regexp(%w(http https))
    end
  end
end