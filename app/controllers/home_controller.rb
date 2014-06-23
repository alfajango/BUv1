class HomeController < ApplicationController
  def index
    # SEC: This could be dangerous. Either remove or scope users to current_user.company
    #   Doesn't seem to be used anywhere though.
    @users = User.all
  end

end
