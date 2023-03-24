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

  def update
    @comment = Comment.find(params[:id])
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |f|
      f.turbo_stream { render turbo_stream: turbo_stream.remove("comments_book_#{@comment.reference_id}") }
      f.html { redirect_to comment_url, notice: 'Deleted!' }
      f.json { head :no_content }
    end
  end

  private

  def comment_data
    params.permit(:name, :message, :type, :reference_id)
  end
end
