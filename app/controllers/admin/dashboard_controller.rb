class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with  name: ENV["ADMIN_NAME"], 
                                password: ENV["ADMIN_PASS"]
                                
  def show
    @num_categories = Category.all.count
    @num_products = Product.all.count
  end
end
