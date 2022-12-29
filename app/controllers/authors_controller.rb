class AuthorsController < ApplicationController
  def show
    @author = Author.includes(:wikipedium).find(params[:id])
  end

  def edit
    @author = Author.includes(:wikipedium).find(params[:id])
  end

  def update
    author = Author.find(params[:id])
    if author.update(author_data)
      if author.wikipedium.update(wikipedium_data)
        render action: show
      end
    end
  end

  private
    def author_data
      params.require(:author).permit(:name, :bio, :gender, :summary, :born, :died)
    end

    def wikipedium_data
      params.require(:author).permit(:url, :found)
    end
end
