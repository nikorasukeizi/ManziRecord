class LabelsController < ApplicationController

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


end
