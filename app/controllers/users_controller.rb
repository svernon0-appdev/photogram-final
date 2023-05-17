class UsersController < ApplicationController

  def index
    @users = User.all

    render({ :template => "users/index.html.erb" })
  end

end
