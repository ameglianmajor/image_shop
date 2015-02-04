module ImageShop

  class Error < StandardError
  end

  class ValueError < Error
    attr_accessor :param, :value, :error

    def initialize(param, value, error)
      @param = param
      @value = value
      @error = error
    end

    def to_s
      "The parameter '#{@param}' value '#{@value}' is problematic. #{@error}"
    end
  end

  class CropConstraintError < Error

    def initialize
    end

    def to_s
      "The parameter values specified do not satisfy the constraints required to successfully crop an image."
    end
  end

  class ImageUnretrievable < Error
    attr_accessor :url

    def initialize(url)
      @url = url
    end

    def to_s
      "The image at the '#{@url}' is unretrievable."
    end
  end

end