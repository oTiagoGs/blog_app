class AdminsBackoffice::AdminsController < AdminsController
  def index
    @admins = Admin.all
  end
end
