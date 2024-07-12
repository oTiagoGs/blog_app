class AddRecommendedToArticle < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :recommended, :boolean, default: false
  end
end
