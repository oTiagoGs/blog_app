class AdminsBackoffice::AdminsController < AdminsController
  before_action :set_admin, only: [:edit, :update, :destroy]
  before_action :verify_password, only: [:update]

  def index
    @admins = Admin.all.page(params[:page])
  end

  def new
    @admin = Admin.new
    @admin.build_admin_profile
  end

  def create
    @admin = Admin.new(admin_params)

    if @admin.save
      redirect_to admins_backoffice_admins_path, notice: "Administrador cadastrado com sucesso!!"
    else
      render :new
    end
  end

  def edit
    @admin.build_admin_profile if @admin.admin_profile.blank?
  end

  def update
    if @admin.update(admin_params)
      redirect_to admins_backoffice_admins_path, notice: "Administrador atualizado com sucesso!!"
    else
      render :edit
    end
  end

  def destroy
    if @admin.destroy
      redirect_to admins_backoffice_admins_path, notice: "Administrador excluido com sucesso!!"
    else
      render :index
    end
  end

  private

  def admin_params
    params.require(:admin).permit(:email, :password, :password_confirmation,
    admin_profile_attributes: [:id, :first_name, :second_name, :gender, :cpf, :birthdate, :avatar])
  end

  def set_admin
    @admin = Admin.find(params[:id])
  end

  def verify_password
    if params[:admin][:password].blank? && params[:admin][:password_confirmation].blank?
      params[:admin].extract!(:password, :password_confirmation)
    end
  end
end
