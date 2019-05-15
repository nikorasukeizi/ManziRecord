class LabelsController < ApplicationController

  def edit
  	  @label = Label.find(params[:id])
  end

  def update
  	  label = Label.find(params[:id])
  	  label.update
      redirect_to artists_labels_genres_index_path
  end

  def destroy
  	  label = Label.find(params[:id])
  	  label.destroy
  	  redirect_to artists_labels_genres_index_path
  end

end
