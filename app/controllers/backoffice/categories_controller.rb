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
    @category = CategoryService.create(params_category)
    if @category.errors.any?
      render :new
    else
      redirect_to backoffice_categories_path, notice: ("Categoria " + "#{@category.description}" + " salva com sucesso!!!")
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

  def destroy 
    c = set_category.description
    if set_category.destroy
      redirect_to backoffice_categories_path, notice: ("Categoria '#{c}' excluida com sucesso!!!")
    else
      render :new
    end    
  end   

  private
  def set_category
    @category = Category.find(params[:id])
  end  

  def params_category
    params.require(:category).permit(:description)
  end
end
