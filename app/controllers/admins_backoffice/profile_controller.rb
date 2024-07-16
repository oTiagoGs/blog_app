class AdminsBackoffice::ProfileController < AdminsController
    before_action :set_admin
    before_action :verify_password, only: [:update]

    def edit
        @admin.build_admin_profile if @admin.admin_profile.blank?
    end

    def update
        if @admin.update(params_admin)
            bypass_sign_in(@admin)
            if params_admin[:admin_profile_attributes][:avatar]
                redirect_to admins_backoffice_welcome_index_path, notice: "Avatar atualizado com sucesso!!"
            else
                redirect_to admins_backoffice_profile_path, notice: "Perfil do administrador atualizado com sucesso!!"
            end
        else
            render :edit
        end
    end

    private

    def set_admin
        @admin = Admin.find(current_admin.id)
    end

    def params_admin
        params.require(:admin).permit(:email, :password, :password_confirmation,
        admin_profile_attributes: [:id, :first_name, :second_name, :gender, :cpf, :birthdate, :avatar])
    end 

    def verify_password
        if params[:admin][:password].blank? && params[:admin][:password_confirmation].blank?
            params[:admin].extract!(:password, :password_confirmation)
        end
    end
end
