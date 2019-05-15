class ItemsController < ApplicationController
  def top
  end

  def show
  end

  def index
  end

  def search_result
  end

  def ranking
  end

  def new
      @item = Item.new
      @item.discs.build
  end

  def edit
  end

  def create
      item = Item.new(item_params)
      item.save
      redirect_to item_path(@item.id)
  end

  def update
  end
end
