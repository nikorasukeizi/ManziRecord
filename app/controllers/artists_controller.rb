class ArtistsController < ApplicationController
  def edit
  	  @artist = Artist.find(params[:id])
  end

  def update
  	  artist = Artist.find(params[:id])
  	  artist.update(artist_params)
  	  redirect_to artists_labels_genres_index_path
  end

  def destroy
  	  artist = Artist.find(params[:id])
  	  artist.destroy
  	  redirect_to artists_labels_genres_index_path
  end



    private

      def artist_params
          params.require(:artist).permit(:name)
      end

end
