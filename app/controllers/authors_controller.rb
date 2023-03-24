class AuthorsController < ApplicationController
  def show
    @author = Author.includes(:wikipedium).find(params[:id])
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_data)

    respond_to do |f|
      if @author.save
        f.html { redirect_to books_url, notice: "Author created" }
      else
        f.html { render :new, status: :unprocessable_entity }
      end
    end
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
