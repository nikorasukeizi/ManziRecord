class LabelsController < ApplicationController

  before_action :require_admin

  def edit
  	  @label = Label.find(params[:id])
  end

  def update
  	  label = Label.find(params[:id])
  	  label.update(label_params)
      redirect_to artists_labels_genres_index_path
  end

  def destroy
  	  label = Label.find(params[:id])
  	  label.destroy
  	  redirect_to artists_labels_genres_index_path
  end


      private

      def label_params
          params.require(:label).permit(:name)
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
