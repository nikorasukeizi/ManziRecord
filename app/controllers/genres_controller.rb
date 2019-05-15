class GenresController < ApplicationController
  def ranking
  end

  def edit
  	  @genre = Genre.find(params[:id])
  end

  def update
  	  genre = Genre.find(params[:id])
  	  genre.update
  	  redirect_to artists_labels_genres_index_path
  end

  def destroy
      genre = Genre.find(params[:id])
      genre.destroy
      redirect_to artists_labels_genres_index_path
  end

end
