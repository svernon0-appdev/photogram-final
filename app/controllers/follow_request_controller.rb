class FollowRequestController < ApplicationController
  def create
    follow_request = FollowRequest.new
    follow_request.recipient_id = params.fetch("query_recipient_id")
    follow_request.sender_id = @current_user.id

    if follow_request.valid?
      follow_request.save
      redirect_to("/users", { :notice => "Follow request sent." })
    else
      redirect_to("/users", { :alert => follow_request.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_request = FollowRequest.where({ :id => the_id }).first

    the_request.status = params.fetch("query_status")

    if the_request.valid?
      the_request.save
      redirect_to("/users/#{@current_user.username}", { :notice => "Follow request #{the_request.status}." })
    else
      redirect_to("/users/#{@current_user.username}", { :alert => the_request.errors.full_messages.to_sentence })
  end

  def destroy
    the_id = params.fetch("path_id")
    the_follow_request = FollowRequest.where({ :id => the_id }).at(0)

    the_follow_request.destroy

    redirect_to("/users", { :notice => "User unfollowed."} )
  end
end
