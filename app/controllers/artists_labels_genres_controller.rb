class ArtistsLabelsGenresController < ApplicationController

  before_action :require_admin


  def new
  	  @artist = Artist.new
  	  @label = Label.new
  	  @genre = Genre.new
  end

  def index
      @artists = Artist.all.order("rubi_name")
      @labels = Label.all.order("rubi_name")
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
            return
         end
      end

  	  @label = Label.new(label_params)
  	  if @label.name.present?

  	     if @label.save
         else
            @artist = Artist.new
            @genre = Genre.new
            render :new
            return
         end
      end

  	  @genre = Genre.new(genre_params)
  	  if @genre.name.present?

  	     if @genre.save
         else
            @artist = Artist.new
            @label = Label.new
            render :new
            return
         end
      end

      if @artist.name.present? or @label.name.present? or @genre.name.present?
      redirect_to new_item_path

      else
      redirect_to artists_labels_genres_new_path
      end
  end



  private

      def artist_params
      	  params.require(:artist).permit(:name, :rubi_name)
      end


      def label_params
      	  params.require(:label).permit(:name, :rubi_name)
      end

      def genre_params
      	  params.require(:genre).permit(:name)
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
