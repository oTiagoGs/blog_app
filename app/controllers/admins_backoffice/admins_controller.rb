class AdminsBackoffice::AdminsController < AdminsController
  def index
    @admins = Admin.all
  end

  def edit
    @admin = Admin.find(params[:id])
  end
end
