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
end
