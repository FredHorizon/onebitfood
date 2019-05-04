class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: :show

  def index
    @restaurants = Restaurant.near(params[:city] || 'São Paulo') # 'near' método da geolocalização que fará uma busca próximo ao params city. Caso não exista o params city, ele irá procurar próximo a 'São Paulo'
    filter_by_category if params[:category]
    render json: @restaurants
  end

  def show
    render json: @restaurant, product_categories: true
  end

  def search # uso da gem ransack para implementar buscas
    @restaurants = Restaurant.search(
      name_or_description_cont: params[:q]
      ).result
    @restaurants = @restaurants.near(params[:city]) if params[:city]
    render json: @restaurants
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find_by(id: params[:id])
  end

  def filter_by_category
    @restaurants = @restaurants.select do |r|
      r.category.title == params[:category]
    end
  end
end
