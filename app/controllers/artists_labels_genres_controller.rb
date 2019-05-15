class ArtistsLabelsGenresController < ApplicationController
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
  	  artist = Artist.new(artist_params)
  	  artist.save

  	  label = Label.new(label_params)
  	  label.save

  	  genre = Genre.new(genre_params)
  	  genre.save
  	  redirect_to artists_labels_genres_index_path
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



end
