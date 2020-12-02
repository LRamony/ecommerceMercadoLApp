class Backoffice::CategoriesController < BackofficeController
  
  def index
    @Categorias = Category.all
  end
end
