class ArtistsController < ApplicationController
  def edit
  	  @artist = Artist.find(params[:id])
  end

  def update
  	  artist = Artist.find(params[:id])
  	  artist.update
  	  redirect_to artists_labels_genres_index_path
  end

  def destroy
  	  artist = Artist.find(params[:id])
  	  artist.destroy
  	  redirect_to artists_labels_genres_index_path
  end
end
