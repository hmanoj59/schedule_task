class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  use_growlyflash # except: %i[actions without growlyflash]

  # Also there is another shorthand, to skip callbacks:
  # skip_growlyflash only: %i[actions without growlyflash]

  protected

  # Lograge method for adding extra info to Logging
  def append_info_to_payload(payload)
    super
    payload[:remote_ip] = request.remote_ip
    payload[:host] = request.host
  end

end
