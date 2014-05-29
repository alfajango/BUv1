class ApplicationController < ActionController::Base
  protect_from_forgery

  # the code below allows me to render a new colleage form in the sidebar
  before_filter :load_newuser

  def load_newuser
  	@newuser = User.new

  end
end
