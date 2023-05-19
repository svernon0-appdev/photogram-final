class LikesController < ApplicationController
  def create
    the_like = Like.new
    the_like.fan_id = params.fetch("query_fan_id")
    the_like.photo_id = params.fetch("query_photo_id")

    if the_like.valid?
      the_like.save
      redirect_to("/", { :notice => "Like created successfully." })
    else
      redirect_to("/", { :alert => the_like.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_like = Like.where({ :id => the_id }).at(0)

    the_like.destroy

    redirect_to("/", { :notice => "Like deleted successfully."} )
  end
end
