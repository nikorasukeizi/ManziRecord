class ArtistsLabelsGenresController < ApplicationController

  before_action :require_admin


  def new
  	  @artist = Artist.new
  	  @label = Label.new
  	  @genre = Genre.new
  end

  def index
      @artists = Artist.all
      @labels = Label.all
      @genres = Genre.all
  end

  def create
  	  @artist = Artist.new(artist_params)
  	  if @artist.name.present?
  	     
         if @artist.save
         else
            @label = Label.new
            @genre = Genre.new
            render :new
         end
      end

  	  label = Label.new(label_params)
  	  if label.name.present?
  	  label.save
      end

  	  genre = Genre.new(genre_params)
  	  if genre.name.present?
  	  genre.save
      end
      if @artist.name.present? or label.name.present? or genre.name.present?
      redirect_to new_item_path

      else
      redirect_to artists_labels_genres_new_path
      end
  end



  private

      def artist_params
      	  params.require(:artist).permit(:name)
      end


      def label_params
      	  params.require(:label).permit(:name)
      end

      def genre_params
      	  params.require(:genre).permit(:name)
      end

      def require_admin
        if user_signed_in?
          unless current_user.admin?
             redirect_to root_path
          end
        else
          redirect_to root_path
        end
      end

end
