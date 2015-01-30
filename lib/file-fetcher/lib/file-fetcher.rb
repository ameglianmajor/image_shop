module FileFetcher
  class Base

    attr_accessor :connection

    def initialize()
      @connection = Faraday.new() do |conn|
        builder.adapter Faraday.default_adapter
      end
    end

    def get_image(url)
      debugger
      response = connection.get url
    end

  end
end