class AddArticlesCountToSubjects < ActiveRecord::Migration[5.2]
  def change
    add_column :subjects, :articles_count, :integer
  end
end
