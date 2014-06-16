class ApplicationController < ActionController::Base
  protect_from_forgery

  # the code below allows me to render a new colleage form in the sidebar
  before_filter :load_newuser

  def load_newuser
  	@newuser = User.new

  end
 
 ## add per SO to get 404 error?
  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end  

  # pagination global - this is what works  Make sure I put <%= will paginate %> everywhere that I do
  #  .paginate(page: params[:page])   in the controller
  WillPaginate.per_page = 25
end
