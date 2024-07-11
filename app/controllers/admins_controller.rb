class AdminsController < ApplicationController
    before_action :authenticate_admin!
    before_action :build_profile
    layout 'admins'

    private

    def build_profile
        current_admin.build_admin_profile if current_admin.admin_profile.blank?
    end
end
