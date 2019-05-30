class GenresController < ApplicationController

  before_action :require_admin, only: [:edit, :update, :destroy]

  def ranking
    @genre = Genre.find(params[:id])
    @genre_rank = ranking_comp.where(genre_id: @genre.id).page(params[:page]).per(9)
    @rank_num = {}
    page_offset = 0
    if params[:page].to_i >= 2
      page_offset = (params[:page].to_i - 1) * 9
    end
    @genre_rank.each_with_index do |item,i|
      @rank_num[item.id] = i + 1 + page_offset
    end
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
