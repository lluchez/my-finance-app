class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def hello
    render text: user_signed_in? ? %Q(Hello #{current_user.name}) : "Not logged yet..."
    #puts user_signed_in? ? %Q(Hello #{current_user.email}) : "Not logged yet..."
  end

  protected
  def not_found
    #raise ActionController::RoutingError.new('Not Found')
    respond_to do |format|
      format.html { render :file => "#{Rails.root}/app/views/errors/404", :layout => true, :status => :not_found }
      #format.json  { head :not_found }
      #format.xml  { head :not_found }
      format.any  { head :not_found }
    end
  end

end
