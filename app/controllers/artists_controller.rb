class ArtistsController < ApplicationController

  before_action :require_admin

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

      def require_admin
          if user_signed_in?

              if current_user.admin?
              else
                 redirect_to root_path
              end
          else
            redirect_to root_path

          end
      end

end
