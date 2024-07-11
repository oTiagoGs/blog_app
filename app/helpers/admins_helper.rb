module AdminsHelper
    def gender_select(admin, current_gender)
        admin.admin_profile.gender == current_gender ? 'btn-primary' : 'btn-secondary'
    end

    def avatar_url
        avatar = current_admin.admin_profile.avatar
        avatar.attached? ? avatar : 'img.jpg'
    end
end
