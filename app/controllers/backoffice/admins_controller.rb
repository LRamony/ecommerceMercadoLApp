class Backoffice::AdminsController < BackofficeController
    before_action :set_category, only: [:edit, :update]

    def index
        @Categorias = Admin.all
    end

    def new
        @category = Admin.new
    end

    def create 
        #@category = Category.new(params.require(:category).permit(:description))
        @category = Admin.new(params_category)
        if @category.save 
            redirect_to backoffice_admins_path, notice: ("Admins " + "#{@category.email}" + " salva com sucesso!!!")
        else
            render :new
        end    
    end 

    def edit 
    end

    def update 
        pwd = params[:admin][:password]
        pwd_confirmation = params[:admin][:password_confirmation]
        
        if pwd.blank? && pwd_confirmation.blank?
            params[:admin].delete(:password)
            params[:admin].delete(:password_confirmation)
        end 

        if @category.update(params_category)
            redirect_to backoffice_admins_path, notice: ("Admins " + "'#{@category.email}'" + " atualiza com sucesso!!!")
        else
            render :edit
        end    
    end  

    def destroy 
        #c = set_category.description
        if set_category.destroy
            redirect_to "/backoffice/admins", notice: ("Admin excluidp com sucesso!!!")
        else
            render :new
        end    
    end   

    private
    def set_category
        @category = Admin.find(params[:id])
    end  

    def params_category
        params.require(:admin).permit(:name,:email, :password, :password_confirmation)
    end
end
