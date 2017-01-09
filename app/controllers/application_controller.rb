class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  #layout "application"

  def hello
    render text: user_signed_in? ? %Q(Hello #{current_user.name}) : "Not logged yet..."
    #puts user_signed_in? ? %Q(Hello #{current_user.email}) : "Not logged yet..."
  end

end
