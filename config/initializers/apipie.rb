Apipie.configure do |config|
  config.app_name                = "ImageShop"
  config.api_base_url            = "/"
  config.doc_base_url            = "/apipie"
  # where is your API defined?
  config.api_controllers_matcher = "#{Rails.root}/app/controllers/*.rb"
  # Semantic Versioning is being used.
  config.app_info["1.0.0"] = <<-EOS
  ImageShop API

  The available calls are listed below.
  EOS
end
