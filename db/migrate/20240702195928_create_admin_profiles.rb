class CreateAdminProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :admin_profiles do |t|
      t.string :first_name
      t.string :second_name
      t.string :gender
      t.string :cpf
      t.date :birthdate
      t.references :admin, foreign_key: true

      t.timestamps
    end
  end
end
