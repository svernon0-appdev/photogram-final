class UsersController < ApplicationController
  def index
    @users = User.all

    render({ :template => "users/index.html.erb" })
  end

  def show
    username = params.fetch(:route_username)

    @user = User.where({ :username => username }).first

    @followers = @user.requests_recieved.where({ :status => 'accepted' })

    @following = @user.requests_sent.where({ :status => 'accepted' })

    render({ :template => "users/show.html.erb" })
  end

  def feed
    username = params.fetch(:route_username)

    @user = User.where({ :username => username }).first

    @followers = @user.requests_recieved.where({ :status => 'accepted' })

    @following = @user.requests_sent.where({ :status => 'accepted' })

    render({ :template => "users/feed.html.erb"})
  end

  def liked_photos
    username = params.fetch(:route_username)

    @user = User.where({ :username => username }).first

    @followers = @user.requests_recieved.where({ :status => 'accepted' })

    @following = @user.requests_sent.where({ :status => 'accepted' })

    render({ :template => "users/liked_photos.html.erb" })
  end

  def discover
    username = params.fetch(:route_username)

    @user = User.where({ :username => username }).first

    @followers = @user.requests_recieved.where({ :status => 'accepted' })

    @following = @user.requests_sent.where({ :status => 'accepted' })
    
    render ({ :template => "users/discover.html.erb" })
  end
end
