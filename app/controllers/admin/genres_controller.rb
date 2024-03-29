class Admin::GenresController < ApplicationController

   def index
    @genres = Genre.all.page(params[:page]).per(10)
    @genre = Genre.new
   end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to admin_genres_path
    else
      @genres = Genre.all.page(params[:page]).per(10)
      render :index
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def destroy
    @genre = Genre.find(params[:id])
    @genre.destroy
    redirect_to admin_genres_path
  end


  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
    redirect_to admin_genres_path
    else
    render :edit
    end
  end

  private
  def genre_params
    params.require(:genre).permit(:genre_name)
  end

end





