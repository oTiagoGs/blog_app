class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :title, null: false
      t.string :description
      t.string :url_image 
      t.text :content, null: false
      t.references :subject, foreign_key: true
      t.references :admin, foreign_key: true

      t.timestamps
    end
  end
end
