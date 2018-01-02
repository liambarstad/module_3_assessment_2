class Api::V1::ItemsController < ApplicationController

  def index
    render json: Item.all
  end

  def show
    render json: Item.find(params[:id])
  end

  def destroy
    item = Item.find(params[:id])
    if item.destroy
      render json: { message: 'item successfully deleted' }, status: 204
    end
  end

  def create
    item = Item.new(name: params[:name],
                    description: params[:description],
                    image_url: params[:image_url])
    if item.save
      render json: item, status: 201
    end
  end

end
