class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['HTTP_AUTH_UN'], password: ENV['HTTP_AUTH_PW']
  
  def show
    @product_count = Product.count
    @category_count = Category.count
  end
end
