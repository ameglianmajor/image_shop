module FileFetcher
  class Base

    attr_accessor :connection

    def initialize()
      @connection = Faraday.new() do |builder|
        builder.adapter Faraday.default_adapter
      end
    end

    def get_image(url)
      response = connection.get url
    end

  end
end