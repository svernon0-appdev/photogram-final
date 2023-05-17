class UsersController < ApplicationController

  def index
    @users = User.all

    render({ :template => "users/index.html.erb" })
  end

  def show
    username = params.fetch(:route_username)

    @user = User.where({ :username => username }).first

    render({ :template => "users/show.html.erb" })
  end

end
