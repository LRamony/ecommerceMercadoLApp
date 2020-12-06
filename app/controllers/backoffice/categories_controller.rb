class Backoffice::CategoriesController < BackofficeController
  before_action :set_category, only: [:edit, :update]

  def index
    @Categorias = Category.all
  end

  def new
    @category = Category.new
  end

  def create 
    #@category = Category.new(params.require(:category).permit(:description))
    @category = Category.new(params_category)
    if @category.save 
      redirect_to backoffice_categories_path, notice: ("Categoria " + "#{@category.description}" + " salva com sucesso!!!")
    else
      render :new
    end    
  end 
  
  def edit 
  end
  
  def update 
    if @category.update(params_category)
      redirect_to backoffice_categories_path, notice: ("Categoria " + "'#{@category.description}'" + " atualiza com sucesso!!!")
    else
      render :edit
    end    
  end  

  def delete 
  end   

  private
  def set_category
    @category = Category.find(params[:id])
  end  

  def params_category
    params.require(:category).permit(:description)
  end
end
