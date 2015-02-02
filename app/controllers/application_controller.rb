class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  around_filter :apipie_validation_errors_send_bad_request

  def apipie_validation_errors_send_bad_request
    begin
      yield
    rescue Apipie::ParamMissing => e
      respond_to do |format|
        debugger
        handle_response(e, format, :missing)
      end
    rescue Apipie::ParamInvalid => e
      respond_to do |format|
        handle_response(e, format, :invalid)
      end
    end
  end

    private

    def handle_response(e, format, condition)
      format.json { render json:
        { errors: { e.param => [ condition ] } }, status: :bad_request
      }
      format.html { render json:
        { errors: { e.param => [ condition ] } }, status: :bad_request
      }
    end
end
