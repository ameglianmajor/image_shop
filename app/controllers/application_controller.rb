class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  rescue_from "Apipie::ParamMissing", with: :handle_error
  rescue_from "Apipie::ParamInvalid", with: :handle_error
  rescue_from "ImageShop::ValueError", with: :handle_error
  rescue_from "ImageShop::ImageUnretrievable", with: :handle_error
  rescue_from "ImageShop::CropConstraintError", with: :handle_error

    private

    def handle_error(exception)
      respond_to do |format|
        handle_response(exception, format)
      end
    end

    def handle_response(e, format)
      format.json { render json:
        { errors: e.to_s }, status: :bad_request
      }
      format.html { render json:
        { errors: e.to_s }, status: :bad_request
      }
    end
end
