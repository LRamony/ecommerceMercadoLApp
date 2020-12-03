class Backoffice::CategoriesController < BackofficeController
  
  def index
    @Categorias = Category.all
  end

  def new
  end

  def create 
  end 
  
  def edit 
  end
  
  def update 
  end  
  
end
