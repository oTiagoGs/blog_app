module AdminsHelper
    def gender_select(admin, current_gender)
        admin.admin_profile.gender == current_gender ? 'btn-primary' : 'btn-secondary'
    end
end
