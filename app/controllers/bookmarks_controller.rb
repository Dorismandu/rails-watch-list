class BookmarksController < ApplicationController
  before_action :set_bookmark, only: [:show, :destroy]
  def new
    @bookmark = Bookmark.new
    @list = List.find(params[:list_id])
  end

  def create
    @list = List.find(params[:list_id])
    @movie = Movie.find(params[:bookmark][:movie_id])
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new
    end
    
  end

  def destroy
    @list = @bookmark.list
    @bookmark.destroy
    redirect_to(@list)
  end

  private
  def set_bookmark 
    @bookmark = Bookmark.find(params[:id])
  end
  
  def bookmark_params
    params.require(:bookmark).permit(:movie_id, :comment)
  end
end
