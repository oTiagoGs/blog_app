class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :article
  has_one :admin_profile, dependent: :destroy
  accepts_nested_attributes_for :admin_profile, reject_if: :all_blank

  # Paginação Kaminari
  paginates_per 5

  def full_name
    [self.admin_profile.first_name, self.admin_profile.second_name].join(' ')
  end
end
