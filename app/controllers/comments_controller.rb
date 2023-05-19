class CommentsController < ApplicationController
  def create
    the_comment = Comment.new
    the_comment.author_id = @current_user.id
    the_comment.body = params.fetch("query_body")
    the_comment.photo_id = params.fetch("query_photo_id")

    if the_comment.valid?
      the_comment.save
      redirect_to("/photos/#{the_comment.photo_id}", { :notice => "Comment created successfully." })
    else
      redirect_to("/photos/#{the_comment.photo_id}", { :alert => the_comment.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_comment = Comment.where({ :id => the_id }).at(0)

    the_comment.author_id = params.fetch("query_author_id")
    the_comment.body = params.fetch("query_body")
    the_comment.photo_id = params.fetch("query_photo_id")

    if the_comment.valid?
      the_comment.save
      redirect_to("/comments/#{the_comment.id}", { :notice => "Comment updated successfully."} )
    else
      redirect_to("/comments/#{the_comment.id}", { :alert => the_comment.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_comment = Comment.where({ :id => the_id }).at(0)

    the_comment.destroy

    redirect_to("/comments", { :notice => "Comment deleted successfully."} )
  end
end
