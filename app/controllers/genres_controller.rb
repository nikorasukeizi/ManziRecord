class GenresController < ApplicationController

  before_action :require_admin

  def ranking
  end

  def edit
  	  @genre = Genre.find(params[:id])
  end

  def update
  	  genre = Genre.find(params[:id])
  	  genre.update(genre_params)
  	  redirect_to artists_labels_genres_index_path
  end

  def destroy
      genre = Genre.find(params[:id])
      genre.destroy
      redirect_to artists_labels_genres_index_path
  end



     private
     

      def genre_params
          params.require(:genre).permit(:name)
      end

      def require_admin
          if current_user.admin?
          else
             redirect_to root_path
          end
      end

end
