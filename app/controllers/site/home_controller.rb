class Site::HomeController < ApplicationController
  layout "site"
  
  def index
    @Categories = Category.all
  end
end
