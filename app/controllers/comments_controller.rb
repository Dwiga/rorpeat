class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_data)

    respond_to do |f|
      if @comment.save
        f.turbo_stream
      else
        flash.alert = 'Commenting failed'
      end
    end
  end

  private

  def comment_data
    params.permit(:name, :message, :type, :reference_id)
  end
end
